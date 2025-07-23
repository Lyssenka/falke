{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    age.keyFile = "/home/lyssa/.config/sops/age/keys.txt";
    sshKeyPaths = "/home/lyssa/.ssh/id_ed25519";
    secrets.lyssa-email = { };
    secrets.lyssa-password = { };
  };
}
