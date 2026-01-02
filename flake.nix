{
  description = "Falke NixOS flake for centrally commandeering a multitude of hosts";

  inputs = {
    # Unstable NixOS for latest packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager for managing userspace stuff
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sops-nix for secrets management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri as my compositor
    niri.url = "github:sodiboo/niri-flake";

    # stylix for consistent theming
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # spicetify-nix to customize spotify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    openmw-nix = {
      url = "git+https://codeberg.org/PopeRigby/openmw-nix.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        elster = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # pass all inputs and username on to further config
          modules = [
            ./hosts/elster
            inputs.sops-nix.nixosModules.sops
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.lyssa = import ./home/lyssa;
                backupFileExtension = "bak";
              };
              ### nixpkgs.hostPlatform = "x86_64-linux";
              sops.defaultSopsFile = ./secrets/secrets.yaml;
            }
            inputs.stylix.nixosModules.stylix
          ];
        };

        eule = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # pass all inputs and username on to further config
          modules = [
            ./hosts/eule
            inputs.sops-nix.nixosModules.sops
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.lyssa = import ./home/lyssa;
                backupFileExtension = "bak";
              };
              ### nixpkgs.hostPlatform = "x86_64-linux";
              sops.defaultSopsFile = ./secrets/secrets.yaml;
            }
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
