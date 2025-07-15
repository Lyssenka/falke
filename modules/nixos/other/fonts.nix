{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      inter
      twemoji-color-font

      atkinson-hyperlegible
      nerd-fonts.jetbrains-mono
    ];
  };
}
