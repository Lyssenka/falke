{ config, pkgs, ... }:
{
  imports = [
    # Include hardware scan and custom modules
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];

  # We have to specify compression in the config for our Btrfs filesystem
  # Use Systemd-boot, change kernel to the latest one and prioritize loading the amd kernelmod

  services.thermald.enable = true;
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
  programs.light.enable = true;

  networking = {
    hostName = "eule";
  };

  system.stateVersion = "25.11";
}
