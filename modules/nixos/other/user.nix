{
  config,
  pkgs,
  ...
}:
{
  # sops.secrets.lyssa-password.neededForUsers = true;
  users.users.lyssa = {
    isNormalUser = true;
    description = "Lyssa";
    extraGroups = [
      "wheel"
      "media"
      "networkmanager"
      "libvirt"
      "video"
      "audio"
    ];
    shell = pkgs.bash;
    #    hashedPasswordFile = config.sops.secrets.lyssa-password.path;
  };
  programs.bash.interactiveShellInit = ''
    if ! [ "$TERM" = "dumb" ]; then
      exec nu
    fi
  '';
}
