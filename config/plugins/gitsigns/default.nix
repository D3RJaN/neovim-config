{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.gitsigns;
in
{
  options.modules.gitsigns.enable = lib.mkEnableOption "Enables gitsigns";

  config = lib.mkIf cfg.enable {
    plugins.gitsigns = {
      enable = true;
      inherit (import ./settings.nix) settings;
    };
  };
}
