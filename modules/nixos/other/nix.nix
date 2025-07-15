{...}: {
  nix = {
    settings = {
      trusted-users = ["lyssa" "root"];
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };
  nixpkgs.config.allowUnfree = true;
}
