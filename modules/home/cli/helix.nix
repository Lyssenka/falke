{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.vro.programs.helix;
in
{
  options.vro.programs.helix = {
    enable = mkEnableOption "Enable Helix and necessary LSPs?";
  };

  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
      package = inputs.helix.packages."x86_64-linux".default;
      settings = {
        editor = {
          bufferline = "multiple";
          line-number = "relative";
          color-modes = true;
          end-of-line-diagnostics = "hint";
          inline-diagnostics = {
            cursor-line = "warning";
          };
          lsp.display-inlay-hints = true;
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          indent-guides.render = true;
        };
      };
      languages = {
        language-server = {
          qmlls = {
            args = [ "-E" ];
            command = "qmlls";
          };
          uwu-colors = {
            command = "${pkgs.uwu-colors}/bin/uwu_colors";
          };
        };
        language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          }
          {
            name = "css";
            auto-format = true;
            language-servers = [ "uwu-colors" ];
          }
        ];
      };
    };

    home.packages = [
      pkgs.nixd
      pkgs.nixfmt-rfc-style
      pkgs.clang-tools
      pkgs.vscode-langservers-extracted
      pkgs.bash-language-server
      pkgs.typescript-language-server
      pkgs.haskell-language-server
      pkgs.jdt-language-server
      pkgs.lua-language-server
      pkgs.rust-analyzer
    ];
  };
}
