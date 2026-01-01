{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 18;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [
          "custom/menu"
          "niri/workspaces"
          "custom/media"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "battery"
        ];

        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          warp-on-scroll = false;
          format = "<b><span font='12'>{icon}</span></b>";
          format-icons = {
            default = "○";
            active = "●";
            urgent = "◉";
            empty = "○";
          };
        };

        "tray" = {
          icon-size = 18;
          spacing = 5;
        };

        "clock" = {
          format = "{:%b %e - %H:%M}";
        };

        "custom/media" = {
          format = "{icon}{text}";
          return-type = "json";
          format-icons = {
            Playing = " ";
            Paused = " ";
          };
          max-length = 70;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "playerctl -a play-pause";
        };
        "custom/menu" = {
          format = "<span font='12'> </span>";
          on-click = "wlogout";
          tooltip = false;
        };
        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-source = "";
          format-source-muted = " ";
          format-icons = {
            headphone = " ";
            phone = " ";
            default = [
              ""
              " "
              " "
            ];
          };
          on-click = "pwvucontrol";
          on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        };
        "battery" = {
          interval = 60;
          format = "{capacity}%";
          tooltip-format = "{time} @ {power}";
        };
      };
    };
    style = ''
            @define-color bg #282828;
      @define-color bg-hover #504945;
      @define-color text #ebdbb2;
      @define-color red #fb4934;
      @define-color green #b8bb26;
      @define-color yellow #fabd2f;
      @define-color blue #83a598;
      @define-color purple #d3869b;
      @define-color aqua #8ec07c;
      @define-color orange #fe8019; 

      * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: Inter;
          border-color:transparent;
          font-size: 14px;
      }

      window#waybar {
          background-color: @bg;
      }

      window#waybar:first-child > box {
      	color: @text;
      	background-color: transparent;
      }

      #workspaces {

      }

      #workspaces button {
          color: @text;
          background-color: @bg;
          border-radius: 0px;
          /* margin-left: 5px; */
          /* margin-right: 5px; */
          padding: 0px;
      }

      #workspaces button:first-child {
      	margin-left: 5px;
      }

      #workspaces button:last-child {
      	margin-right: 5px;
      }

      #workspaces button:hover {
          border-color: transparent;
          color: @text;
          box-shadow: inherit;
          text-shadow: inherit;
          background: @bg-hover;
      }

      #workspaces button.persistent {
      	color: @text;
      }

      #workspaces button.empty {
      	color: #504945;
      }

      #workspaces button.active {
      	color: @text;
      }

      #workspaces button.urgent {
          color: @red;
      }

      #window {
      	background-color: transparent;
      	font-family: JetBrains Mono Nerd Font;
      }

      #custom-media {
          background-color: transparent;
          color: @aqua;
          margin-left: 10px;
          padding-left: 5px;
          padding-right: 5px;
      }

      #custom-media:hover {
      	background-color: @bg-hover;
      }

      #custom-menu {
      	color: @blue;
      	margin-left: 5px;
      }



      #tray,
      #pulseaudio,
      #custom-notification,
      #clock {
      }

      #clock {
      	background-color: transparent;
      }

      #battery {
      background-color: transparent;
      color: @green;
      margin-right: 10px;
      margin-left: 5px;
      padding-left: 5px;
      padding-right: 5px;
      }

      #battery:hover {
       background-color: @bg-hover;
       }

      #pulseaudio {
      	background-color: transparent;
      	color: @yellow;
      	margin-right: 5px;
      	margin-left: 5px;
      	padding-left: 5px;
      	padding-right: 5px;
      }

      #pulseaudio:hover {
      	background-color: @bg-hover;
      }

      #tray {
      	background-color: transparent;
      	margin-right: 5px;
      	margin-left: 5px;
      	padding-left: 5px;
      	padding-right: 5px;
      }

      #tray > .active:hover {
      	background-color: @bg-hover;
      	padding-left: 5px;
      	padding-right: 5px;
      	padding-left: 5px;
      	padding-right: 5px;
      }
    '';
  };
}
