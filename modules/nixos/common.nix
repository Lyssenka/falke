{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    corectrl
    cachix
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
}
