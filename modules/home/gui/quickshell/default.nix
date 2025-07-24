{
  config,
  inputs,
  pkgs,
  ...
}:
{
  home.packages = [
    (inputs.quickshell.packages.${pkgs.system}.default.override {
      withJemalloc = true;
      withQtSvg = true;
      withWayland = true;
      withX11 = false;
      withPipewire = true;
      withPam = true;
      withHyprland = true;
      withI3 = false;
    })
    pkgs.qt6Packages.qt5compat
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.kdePackages.qtbase
    pkgs.kdePackages.qtdeclarative
  ];
  services.swww.enable = true;
  programs.wallust.enable = true;
}
