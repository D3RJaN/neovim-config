{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.lsp;
in
{
  imports = [
    ./clangd.nix
    ./nil_ls.nix
  ];

  options.modules.lsp = {
    enable = lib.mkEnableOption "Enables lsp";
    cssls.enable = lib.mkEnableOption "Enables cssls lsp";
    html.enable = lib.mkEnableOption "Enables html lsp";
    #jinja_lsp.enable = lib.mkEnableOption "Enables jinja_lsp lsp";
    lua_ls.enable = lib.mkEnableOption "Enables lua_ls lsp";
    pyright.enable = lib.mkEnableOption "Enables pyright lsp";
    rust_analyzer.enable = lib.mkEnableOption "Enables rust_analyzer lsp";
    ts_ls.enable = lib.mkEnableOption "Enables ts_ls lsp";
  };

  config.plugins.lsp = lib.mkIf cfg.enable {
    enable = true;
    #inlayHints = true;
    servers = {
      cssls.enable = cfg.cssls.enable;
      html.enable = cfg.html.enable;
      #jinja_lsp.enable = cfg.jinja_lsp.enable;
      lua_ls.enable = cfg.lua_ls.enable;
      nil_ls.enable = cfg.nil_ls.enable;
      pyright.enable = cfg.pyright.enable;
      rust_analyzer = lib.mkIf cfg.rust_analyzer.enable {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      ts_ls.enable = cfg.ts_ls.enable;
    };
  };
}
