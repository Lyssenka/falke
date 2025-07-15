{
  pkgs,
  inputs,
  ...
}: {
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };

  home-manager.sharedModules = [
    {
      home.packages = with pkgs; [
        osu-lazer-bin
        prismlauncher
        pcsx2
        duckstation
        itch
        cemu
        heroic
        inputs.nix-gaming.packages.${pkgs.system}.mo2installer
        inputs.nix-gaming.packages.${pkgs.system}.osu-stable
      ];
    }
  ];
}
