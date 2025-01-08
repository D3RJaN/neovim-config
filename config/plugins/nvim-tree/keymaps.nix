{
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
}
