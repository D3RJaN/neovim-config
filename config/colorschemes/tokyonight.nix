{
  config,
  lib,
  ...
}:
let
  cfg = config.colorschemes.tokyonight;
in
{
  options.colorschemes.tokyonight.enable = lib.mkEnableOption "Enables tokyonight colorscheme";

  config = lib.mkIf cfg.enable {
    colorschemes.tokyonight = {
      enable = true;

      settings = {
        style = "wave";
        light_style = "day";
        transparent = false;
        dim_inactive = false;
        terminal_colors = true;
        styles = {
          comments.italic = true;
          functions = { };
	      variables = { };
          keywords.italic = true;
          statements.bold = true;
        };
      };
    };
  };
}
