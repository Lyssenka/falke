{ config, ... }:
{
  imports = [
    # Include hardware scan and custom modules
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];

  # We have to specify compression in the config for our Btrfs filesystem
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
  };
  # Use Systemd-boot, change kernel to the latest one and prioritize loading the amd kernelmod
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
  };

  vro.gui.gaming.enable = true;

  networking = {
    hostName = "elster";
  };

  system.stateVersion = "25.05";
}
