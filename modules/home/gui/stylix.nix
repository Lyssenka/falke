{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    targets.dunst.enable = false;
    targets.waybar.enable = false;
    targets.firefox.profileNames = [ "default" ];
    cursor = {
      name = "Vimix-cursors";
      package = pkgs.vimix-cursors;
      size = 24;
    };
    icons = {
      enable = true;
      package = pkgs.vimix-icon-theme;
      light = "Vimix";
      dark = "Vimix";
    };
    fonts = {
      sansSerif = {
        package = pkgs.atkinson-hyperlegible;
        name = "Atkinson Hyperlegible";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
  };
}
