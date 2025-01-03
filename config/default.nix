{
  # Import all your configuration modules here
  imports = [
    ./plugins 
    ./mappings
  ];

  keys.enable = true;
  modules = {
    completion.enable = true;
    dressing.enable = true;
    nvim-tree.enable = true;
    telescope.enable = true;
    which-key.enable = true;
    lsp = {
      enable = true;
      cssls.enable = true;
      html.enable = true;
      #jinja_lsp.enable = true;
      lua_ls.enable = true;
      nil_ls.enable = true;
      pyright.enable = true;
      rust_analyzer.enable = true;
      ts_ls.enable = true;
    };
  };
}
