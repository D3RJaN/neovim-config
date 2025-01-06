{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.nvim-tree;
  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>ee";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle file explorer";
      };
    }
    {
      mode = [ "n" ];
      key = "<leader>ef";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle file explorer on current file";
      };
    }
    {
      mode = [ "n" ];
      key = "<leader>ec";
      action = "<cmd>NvimTreeCollapse<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Collapse file explorer";
      };
    }
    {
      mode = [ "n" ];
      key = "<leader>ec";
      action = "<cmd>NvimTreeRefresh<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Refresh file explorer";
      };
    }
  ];
in
{
  options.modules.nvim-tree.enable = lib.mkEnableOption "Enables nvim-tree";
  
  config = lib.mkIf cfg.enable {
    inherit keymaps;

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
