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

    # lix for a better nix fork
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false; # required to treat it as a regular repo
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    # sops-nix for secrets management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### important base stuff for user ###
    # helix for editing files and code
    helix.url = "github:helix-editor/helix";

    # niri as my compositor
    niri.url = "github:sodiboo/niri-flake";

    # stylix for consistent theming
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### fun stuff ###
    # nix-gaming primarily for osu stable and mo2installer
    nix-gaming.url = "github:fufexan/nix-gaming";

    # spicetify-nix to customize spotify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      elster = let
        username = "lyssa";
      in
        nixpkgs.lib.nixosSystem {
          inherit username; # make username usable in this host config
          specialArgs = {inherit inputs username;}; # pass all inputs and username on to further config
          modules = [
            ./hosts/elster
            inputs.lix-module.nixosModules.default
            inputs.sops-nix.nixosModules.sops
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs username;};
                users.${username} = import ./home/${username};
                backupFileExtension = "bak";
              };
              ### nixpkgs.hostPlatform = "x86_64-linux";
            }
            inputs.stylix.nixosModules.stylix
          ];
        };
    };
  };
}
