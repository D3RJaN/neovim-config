{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.lsp.clangd;
in
{
  options.modules.lsp.clangd.enable = lib.mkEnableOption "Enables clangd lsp";

  config = lib.mkIf cfg.enable {
    plugins.lsp.servers.clangd = {
      enable = true;
      cmd = [ "clangd" ];
      filetypes = [
        "c"
        "cpp"
        "objc"
        "objcpp"
        "cuda"
        "proto"
      ];
      rootDir = ''
      require('lspconfig').util.root_pattern(
              '.clangd',
              '.clang-tidy',
              '.clang-format',
              'compile_commands.json',
              'compile_flags.txt',
              'configure.ac',
              '.git'
              )
      '';
    extraOptions.single_file_support = true;
    };
  };
}
