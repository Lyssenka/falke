{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.vro.gui.gaming;
in
{
  options.vro.gui.gaming = {
    enable = mkEnableOption "Enable programs suited for gaming";
  };

  config = mkIf cfg.enable {

    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

    home-manager.sharedModules = [
      {
        home.packages = with pkgs; [
          osu-lazer-bin
          pcsx2
          itch
          cemu
          heroic
        ];
      }
    ];
  };
}
