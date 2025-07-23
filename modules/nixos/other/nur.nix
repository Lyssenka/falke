{ config, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.nur.overlays.default ];
}
