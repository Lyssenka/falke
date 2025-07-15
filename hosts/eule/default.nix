{config, ...}: {
  imports = [
    # Include hardware scan and custom modules
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];

  # We have to specify compression in the config for our Btrfs filesystem
  # Use Systemd-boot, change kernel to the latest one and prioritize loading the amd kernelmod

  networking = {
    hostName = "eule";
  };

  system.stateVersion = "25.11";
}
