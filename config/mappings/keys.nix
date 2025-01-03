{
  config,
  lib,
  ...
}:
let
  cfg = config.keys;
  keymaps = [
    {
      mode = [ "n" "i" ];
      key = "<Up>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Up arrow key";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<Down>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Down arrow key";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<Right>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Right arrow key";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<Left>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Left arrow key";
      };
    }
    {
        mode = "n";
        key = "<leader>uh";
        action = ":lua ToggleInlayHints()<cr>";
        options = {
          silent = true;
          desc = "Toggle Inlay Hints";
        };
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move up when line is highlighted";
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move down when line is highlighted";
        };
      }
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
        options = {
          silent = true;
          desc = "Allow cursor to stay in the same place after appeding to current line";
        };
      }
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          silent = true;
          desc = "Indent while remaining in visual mode.";
        };
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          silent = true;
          desc = "Indent while remaining in visual mode.";
        };
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          silent = true;
          desc = "Allow <C-d> and <C-u> to keep the cursor in the middle";
        };
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          desc = "Allow C-d and C-u to keep the cursor in the middle";
        };
      }
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
  ];
in
{
  options.keys.enable = lib.mkEnableOption "Enables keys";

  config = lib.mkIf cfg.enable {
    globals.mapleader = " ";
    inherit keymaps;
  };
}
