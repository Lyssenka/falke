{
  config,
  pkgs,
  lib,
  inputs,
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
    programs.gamescope = {
      enable = true;
      package = pkgs.gamescope.overrideAttrs (_: {
        NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];
      });
    };

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    environment.systemPackages = with inputs.openmw-nix.packages.x86_64-linux; [
      delta-plugin
      openmw-validator
      momw-configurator
      umo
      groundcoverify
      s3lightfixes
    ];

    home-manager.sharedModules = [
      {
        home.packages = with pkgs; [
          # osu-lazer-bin
          # pcsx2
          # itch
          # cemu
          heroic
          openmw
          duckstation
          hedgemodmanager
        ];
      }
    ];
  };
}
