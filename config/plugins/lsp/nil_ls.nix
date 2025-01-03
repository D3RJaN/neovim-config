{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.lsp.nil_ls;
in
{
  options.modules.lsp.nil_ls.enable = lib.mkEnableOption "Enables nil_ls lsp";

  config = lib.mkIf cfg.enable {
    plugins.lsp.servers.nil_ls = {
      enable = true;
      cmd = [ "nil" ];
      filetypes = [ "nix" ];
      rootDir = ''
        require('lspconfig').util.root_pattern(
            "flake.nix",
            ".git"
            )
        '';
      extraOptions.single_file_support = true;
    };
  };
}
