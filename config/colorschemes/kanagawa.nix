{
  config,
  lib,
  ...
}:
let
  cfg = config.color.kanagawa;
in
{
  options.color.kanagawa.enable = lib.mkEnableOption "Enables kanagawa colorscheme";

  config = lib.mkIf cfg.enable {
    colorschemes.kanagawa = {
      enable = true;

      theme = "wave";
      undercurl = true;
      commentStyle.italic = true;
      functionStyle = {};
      keywordStyle.italic = true;
      statementStyle.bold = true;
      typeStyle = {};
      transparent = false;
      dimInactive = false;
      terminalColors = true;
      colors = {
        palette = {};
        theme = {
          wave = {};
          lotus = {};
          dragon = {};
          all = {};
        };
      };
      background = {
        dark = "wave";
        light = "lotus";
      };
    };
  };
}
