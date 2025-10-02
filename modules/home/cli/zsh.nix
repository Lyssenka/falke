{ ... }:
{
  programs = {
    nushell = {
      enable = true;
      shellAliases = {
        nrs = "nh os switch ~/falke";
        nfu = "nix flake update ~/falke";
        fc = "hx /home/lyssa/falke/flake.nix";
        nic = "hx /home/lyssa/.config/niri/config.kdl";
      };
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      enableNushellIntegration = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}
