{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.sops-nix.homeManagerModule.sops];

  sops = {
    defaultSopsFile = ./../../../secrets/secrets.yaml;
    sopsDefaultSopsFormat = "yaml";
    age.keyFile = "/home/lyssa/.config/sops/age/keys.txt";
  };
}
