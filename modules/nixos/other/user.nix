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
    ];
    #    hashedPasswordFile = config.sops.secrets.lyssa-password.path;
    shell = pkgs.zsh;
  };
}
