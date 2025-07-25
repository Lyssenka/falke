{ config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.vro.services.bluetooth;
in
{
  options.vro.services.bluetooth = {
    enable = mkEnableOption "Enable Bluetooth and Blueman";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
