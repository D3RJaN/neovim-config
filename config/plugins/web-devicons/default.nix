{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.web-devicons;
in
{
  options.modules.web-devicons.enable = lib.mkEnableOption "Enables web-devicons";

  config = lib.mkIf cfg.enable {
    plugins.web-devicons = {
      enable = true;
      settings = {
        color_icons = true;
        strict = true;
      };
    };
  };
}
