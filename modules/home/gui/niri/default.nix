{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.vro.desktop.niri.home-manager;
  niri-screen-time = inputs.niri-screen-time.packages."${pkgs.system}".default;
in
{
  options.vro.desktop.niri.home-manager = {
    enable = mkEnableOption "Enable HomeManager config for niri";
  };

  config = mkIf cfg.enable {
    services = {
      swww.enable = true;
      dunst = {
        enable = true;
        settings = {
          global = {
            icon_path = "/run/current-system/sw/share/icons/hicolor/32x32/apps/";
            follow = "mouse";
            width = 300;
            height = "(0, 300)";
            offset = "(10, 10)";
            origin = "top-right";
            frame_width = 1;
            layer = "overlay";
            corner_radius = 7;
            foreground = "#ebdbb2";
            background = "#282828";
            highlight = "#fe8019";
            frame_color = "#3c3836";
            font = "Inter 11";
            markup = "full";
            show_indicators = "false";
            format = "<small>%a</small>\\n<b>%s</b>\\n%b";
          };
        };
      };
    };

    programs = {
      niri.config = null;
      wofi = {
        enable = true;
        settings = {
          width = "30%";
          allow_images = true;
          allow_markup = true;
          term = "kitty";
          matching = "multi-contains";
          insensitive = true;
          gtk_dark = true;
          prompt = "meow :3";
        };
      };
    };

    home.packages = [
      pkgs.wl-clipboard
      pkgs.resources
      pkgs.playerctl
      pkgs.waypaper
      pkgs.waybar
      pkgs.wlogout
      pkgs.xwayland-satellite
      pkgs.hyprlock
      niri-screen-time
    ];
  };
}
