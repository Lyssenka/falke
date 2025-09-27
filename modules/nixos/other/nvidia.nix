{ config, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkForce;
  cfg = config.vro.other.nvidia;
in
{
  options.vro.other.nvidia = {
    enable = mkEnableOption "Enable Nvidia GPU Specialisation";
  };

  config = mkIf cfg.enable {
    specialisation.nvidia.configuration = {
      system.nixos.tags = [ "nvidia" ];
      hardware = {
        nvidia.open = true;
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
      boot.blacklistedKernelModules = mkForce [
        "nouveau"
      ];
    };
  };
}
