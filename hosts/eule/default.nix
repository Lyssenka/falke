{ config, pkgs, ... }:
{
  imports = [
    # Include hardware scan and custom modules
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];

  # We have to specify compression in the config for our Btrfs filesystem
  # Use Systemd-boot, change kernel to the latest one and prioritize loading the amd kernelmod

  vro.services.bluetooth.enable = true;
  services.thermald.enable = true;
  services.logind.lidSwitch = "suspend-then-hibernate";
  services.fwupd.enable = true;
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
  hardware = {
    cpu.intel.updateMicrocode = true;
    nvidia.open = true;
    nvidia.nvidiaSettings = true;
    nvidia.modesetting.enable = true;
    nvidia.prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  networking = {
    hostName = "eule";
  };

  system.stateVersion = "25.11";
}
