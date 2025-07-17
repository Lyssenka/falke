{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  sops = {
    defaultSopsFile = ./../../../secrets/secrets.yaml;
    sopsDefaultSopsFormat = "yaml";
    age.keyFile = "/home/lyssa/.config/sops/age/keys.txt";
    secrets.lyssa-email = {};
    secrets.lyssa-password = {};
  };
}
