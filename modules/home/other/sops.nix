{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.sops-nix.homeManagerModules.sops];

  sops = {
    defaultSopsFile = "./../../../secrets/secrets.yaml";
    age.keyFile = "/home/lyssa/.config/sops/age/keys.txt";
  };
}
