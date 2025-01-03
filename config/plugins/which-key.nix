{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.which-key;
in
{
  options.modules.which-key.enable = lib.mkEnableOption "Enables which-key";

  config = lib.mkIf cfg.enable {
    plugins.which-key.enable = true;
  };
}
