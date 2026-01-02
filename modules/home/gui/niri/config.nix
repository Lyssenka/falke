{ config, ... }:
{
  xdg.configFile."niri/config.kdl".text = ''
    input {
        mouse {
            accel-profile "flat"
        }
        keyboard {
            xkb {
                layout "de"
                model ""
                rules ""
                variant ""
            }
            repeat-delay 600
            repeat-rate 25
            track-layout "global"
        }
        touchpad {
            dwt
            tap
            natural-scroll
            scroll-method "two-finger"
        }
        focus-follows-mouse
        mod-key "Super"
        touch {
        map-to-output "Sharp Corporation 0x14D6 Unknown"
        }

    }
    output "eDP-1" {
        scale 2
        transform "normal"
        position x=0 y=0
    }
    output "DP-1" {
        scale 1
        focus-at-startup
        transform "normal"
        position x=1920 y=0
        mode "1920x1080"
    }
    output "DP-2" {
        scale 1
        transform "normal"
        position x=3840 y=0
        mode "1920x1080"
    }
    output "HDMI-A-1" {
        scale 1
        transform "normal"
        position x=0 y=0
        mode "1920x1080"
    }
    screenshot-path "~/Nextcloud/Photos/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
    prefer-no-csd
    layout {
        background-color "transparent"
        gaps 10
        struts {
            left 0
            right 0
            top 0
            bottom 0
        }
        focus-ring {
            width 1
            active-color "#b8bb26"
            inactive-color "#28282800"
        }
        border { off; }
        shadow {
            on
            offset x=0.000000 y=5.000000
            softness 30.000000
            spread 5.000000
            draw-behind-window false
            color "#00000070"
        }
        insert-hint { color "rgb(127 200 255 / 50%)"; }
        default-column-width
        preset-column-widths {
            proportion 0.333330
            proportion 0.500000
            proportion 0.666670
        }
        preset-window-heights {
            proportion 0.333330
            proportion 0.500000
            proportion 1.000000
        }
        center-focused-column "never"
    }
    cursor {
        xcursor-theme "default"
        xcursor-size 24
    }
    hotkey-overlay { skip-at-startup; }
    clipboard { disable-primary; }
    environment {
        DISPLAY ":0"
        EDITOR "hx"
    }
    binds {
        Alt+Print { screenshot-window; }
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+B { spawn "firefox"; }
        Mod+C { center-column; }
        Mod+Comma { consume-or-expel-window-left; }
        Mod+Ctrl+D { reset-window-height; }
        Mod+Ctrl+Down { focus-monitor-down; }
        Mod+Ctrl+H { focus-monitor-left; }
        Mod+Ctrl+J { focus-monitor-down; }
        Mod+Ctrl+K { focus-monitor-up; }
        Mod+Ctrl+L { focus-monitor-right; }
        Mod+Ctrl+Left { focus-monitor-left; }
        Mod+Ctrl+Right { focus-monitor-right; }
        Mod+Ctrl+Shift+F { toggle-windowed-fullscreen; }
        Mod+Ctrl+Up { focus-monitor-up; }
        Mod+D { switch-preset-column-width; }
        Mod+Down { focus-window-down; }
        Mod+E { spawn "nemo"; }
        Mod+End { focus-column-last; }
        Mod+F { maximize-column; }
        Mod+H { focus-column-left; }
        Mod+Home { focus-column-first; }
        Mod+I { focus-workspace-up; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }
        Mod+Left { focus-column-left; }
        Mod+Minus { set-column-width "-10%"; }
        "Mod+Page_Down" { focus-workspace-down; }
        "Mod+Page_Up" { focus-workspace-up; }
        Mod+Period { consume-or-expel-window-right; }
        Mod+Plus { set-column-width "+10%"; }
        Mod+R { spawn "wofi" "--show" "drun"; }
        Mod+Right { focus-column-right; }
        Mod+Shift+1 { move-window-to-workspace 1; }
        Mod+Shift+2 { move-window-to-workspace 2; }
        Mod+Shift+3 { move-window-to-workspace 3; }
        Mod+Shift+4 { move-window-to-workspace 4; }
        Mod+Shift+5 { move-window-to-workspace 5; }
        Mod+Shift+6 { move-window-to-workspace 6; }
        Mod+Shift+7 { move-window-to-workspace 7; }
        Mod+Shift+8 { move-window-to-workspace 8; }
        Mod+Shift+9 { move-window-to-workspace 9; }
        Mod+Shift+D { switch-preset-window-height; }
        Mod+Shift+Down { move-window-down; }
        Mod+Shift+End { move-column-to-last; }
        Mod+Shift+F { fullscreen-window; }
        Mod+Shift+H { move-column-left; }
        Mod+Shift+Home { move-column-to-first; }
        Mod+Shift+J { move-window-down; }
        Mod+Shift+K { move-window-up; }
        Mod+Shift+L { move-column-right; }
        Mod+Shift+Left { move-column-left; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Plus { set-window-height "+10%"; }
        Mod+Shift+Right { move-column-right; }
        Mod+Shift+Up { move-window-up; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }
        Mod+Tab repeat=false { toggle-overview; }
        Mod+U { focus-workspace-down; }
        Mod+Up { focus-window-up; }
        Mod+V { toggle-window-floating; }
        Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollLeft { focus-column-left; }
        Mod+WheelScrollRight { focus-column-right; }
        Mod+WheelScrollUp cooldown-ms=150 { focus-workspace-up; }
        Mod+X { close-window; }
        Mod+M { spawn "appimage-run" "/home/lyssa/Documents/feishin.AppImage"; }
        "Mod+dead_circumflex" { spawn "kitty"; }
        Print { screenshot; }
        XF86MonBrightnessDown { spawn "light" "-U" "5"; }
        XF86MonBrightnessUp { spawn "light" "-A" "5"; }
        XF86Display { spawn "obs"; }
        XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
        XF86AudioMicMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
        XF86AudioMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioNext { spawn "playerctl" "--player=%any,firefox" "next"; }
        XF86AudioPlay { spawn "playerctl" "--player=%any,firefox" "play-pause"; }
        XF86AudioPrev { spawn "playerctl" "--player=%any,firefox" "previous"; }
        XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
    }
    spawn-at-startup "xwayland-satellite"
    spawn-at-startup "swww" "init"
    spawn-at-startup "waybar"
    window-rule {
        match app-id="equibop"
        open-on-output "HDMI-A-1"
        open-on-workspace "1"
        open-maximized true
    }
    window-rule {
        match app-id="Element"
        open-on-output "HDMI-A-1"
        open-on-workspace "2"
        open-maximized true
    }
    window-rule {
        match app-id="Spotify"
        match app-id="Feishin"
        open-on-output "DP-2"
        open-on-workspace "1"
        open-maximized true
    }
    window-rule {
        match app-id="kitty"
        match app-id="nemo"
        match app-id="net.nokyan.Resources"
        match title="Bitwarden"
        default-window-height { proportion 0.500000; }
    }
    window-rule {
        match app-id="com.saivert.pwvucontrol"
        match title="Steam Settings"
        match title="Open Files"
        open-floating true
    }
    layer-rule {
        match namespace="wofi"
        shadow { on; }
    }
    gestures { hot-corners { off; }; }
  '';
}
