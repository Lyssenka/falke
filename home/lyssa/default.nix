{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/home
  ];
  home = {
    username = "lyssa";
    homeDirectory = "/home/lyssa";
    stateVersion = "25.05";
    packages = [
      pkgs.bitwarden
      pkgs.obsidian
      pkgs.gimp3-with-plugins
      pkgs.kdePackages.kdenlive
      pkgs.piper
      pkgs.qbittorrent
      pkgs.equibop
      pkgs.gucharmap
      pkgs.filezilla
      pkgs.nemo-with-extensions
      pkgs.libreoffice
      pkgs.element-desktop
      pkgs.thunderbird
    ];
  };
  vro = {
    programs.helix.enable = true;
    desktop.niri.home-manager.enable = true;
  };

  programs = {
    imv.enable = true;
    firefox.enable = true;
    micro.enable = true;
    git = {
      enable = true;
      userName = "Lyssenka";
      userEmail = "larissa.pf@proton.me";
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    mpv.enable = true;
    jq.enable = true;
  };
  services = {
    udiskie.enable = true;
    nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
