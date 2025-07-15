{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "de";
    excludePackages = [pkgs.xterm];
  };
}
