{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  sops = {
    age.keyFile = "/home/lyssa/.config/sops/age/keys.txt";
    secrets.lyssa-email = {};
    secrets.lyssa-password = {};
  };
}
