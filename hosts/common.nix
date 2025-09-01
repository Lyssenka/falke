{ config, pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  environment.systemPackages = with pkgs; [
    wget
    cachix
    corectrl
    wineWowPackages.stable
    winetricks
    p7zip
    unrar
    xarchiver
    ffmpegthumbnailer
    libnotify
    libsecret
    sops
  ];
  programs = {
    zsh.enable = true;
    nh.enable = true;
    kdeconnect.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };
  };
  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
    };
    printing.enable = true;
    udisks2.enable = true;
    ratbagd.enable = true;
  };

  networking.networkmanager.enable = true;
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      inter
      twemoji-color-font

      atkinson-hyperlegible
      nerd-fonts.jetbrains-mono

    ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    uinput.enable = true;
  };
  nix = {
    settings = {
      trusted-users = [
        "lyssa"
        "root"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };
  nixpkgs.config.allowUnfree = true;
}
