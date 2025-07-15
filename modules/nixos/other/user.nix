{
  config,
  pkgs,
  ...
}: {
  users.users.lyssa = {
    isNormalUser = true;
    description = "Lyssa";
    extraGroups = ["wheel" "media" "networkmanager" "libvirt"];
    initialHashedPassword = config.sops.secrets.lyssa-password;
    shell = pkgs.zsh;
  };
}
