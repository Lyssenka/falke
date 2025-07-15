{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
  };
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.displayManager.gdm.enable = true;
}
