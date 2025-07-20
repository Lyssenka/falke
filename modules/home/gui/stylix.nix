{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    targets.dunst.enable = false;
    targets.waybar.enable = false;
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
