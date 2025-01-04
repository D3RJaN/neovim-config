{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.vimtex;
in
{
  options.modules.vimtex.enable = lib.mkEnableOption "Enables vimtex";

  config = lib.mkIf cfg.enable {
    plugins.vimtex = {
      enable = true;

      settings = {
        view_method = "zathura";
        compiler_latexmk = {
          options = [
            "-shell-escape"
            "-verbose"
            "-file-line-error"
            "-synctex=1"
            "-interaction=nonstopmode"
          ];
        };
      };
    };
  };
}
