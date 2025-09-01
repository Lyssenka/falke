{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    # Include hardware scan and custom modules
    ./hardware-configuration.nix
    ./../../modules/nixos
    ./../common.nix
  ];

  # We have to specify compression in the config for our Btrfs filesystem
  # Use Systemd-boot, change kernel to the latest one and prioritize loading the amd kernelmod
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-partuuid/444dfba8-ba80-4be3-8207-bb4be9018396";
      header = "/dev/disk/by-partuuid/537fdbff-906e-45a6-bc56-b0ad8ea54ba9";
      allowDiscards = true;
      preLVM = true;
    };
    crypted2 = {
      device = "/dev/disk/by-partuuid/3c1c97d1-5457-41f4-8c3b-baccda196ae1";
      header = "/dev/disk/by-partuuid/dcafe161-bc3e-4d56-a76c-ab2a6e4ecb8d";
      allowDiscards = true;
      preLVM = true;
    };
  };
  vro.services.bluetooth.enable = true;
  services.thermald.enable = true;
  services.logind.lidSwitch = "suspend";
  services.fwupd.enable = true;
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
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
    # nvidia.open = true;
    # nvidia.modesetting.enable = true;
    # nvidia.prime = {
    # offload.enable = true;
    # offload.enableOffloadCmd = true;
    # intelBusId = "PCI:0:2:0";
    # nvidiaBusId = "PCI:1:0:0";
    # };
  };
  # services.xserver.videoDrivers = [
  # "modesetting"
  # "nvidia"
  # ];
  boot.blacklistedKernelModules = [
    "nvidia"
    "nvidiafb"
    "nvidia-drm"
    "nvidia-uvm"
    "nvidia-modeset"
    "nouveau"
  ];
  networking = {
    hostName = "eule";
  };

  system.stateVersion = "25.11";
}
