{
  config,
  lib,
  ...
}:
let
  cfg = config.color.tokyonight;
in
{
  options.color.tokyonight.enable = lib.mkEnableOption "Enables tokyonight colorscheme";

  config = lib.mkIf cfg.enable {
    colorschemes.tokyonight = {
      enable = true;

      settings = {
        style = "moon";
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
