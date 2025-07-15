{...}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = ["colorize" "direnv" "starship"];
      };
      shellAliases = {
        nrs = "nh os switch ~/falke";
        nfu = "nix flake update ~/falke";
        fc = "hx /home/lyssa/falke/flake.nix";
        nic = "hx /home/lyssa/.config/niri/config.kdl";
      };
    };

    carapace.enable = true;
    carapace.enableZshIntegration = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
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
