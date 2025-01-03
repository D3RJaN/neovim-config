{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.dressing;
in
{
  options.modules.dressing = {
    enable = lib.mkEnableOption "Enables dressing";
  };

  config.plugins.dressing.enable = cfg.enable;
}
