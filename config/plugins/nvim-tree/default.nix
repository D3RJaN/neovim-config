{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.nvim-tree;
in
{
  options.modules.nvim-tree.enable = lib.mkEnableOption "Enables nvim-tree";
  
  config = lib.mkIf cfg.enable {
    inherit (import ./keymaps.nix) keymaps;

    # Dependency:
    modules.web-devicons.enable = true;

    plugins.nvim-tree = {
      enable = true;
      autoReloadOnWrite = true;
      disableNetrw = true;
      openOnSetup = true;
      openOnSetupFile = true;

      diagnostics = {
        enable = true;
        debounceDelay = 50;
        showOnDirs = true;
        showOnOpenDirs = true;
      };

      git = {
        enable = true;
        ignore = true;
        showOnDirs = true;
        showOnOpenDirs = true;
        timeout = 400;
      };

      actions = {
        filePopup.openWinConfig = {
          border = "shadow";
          col = 1;
          relative = "cursor";
          row = 1;
          style = "minimal";
        };
      };
    };
  };
}
