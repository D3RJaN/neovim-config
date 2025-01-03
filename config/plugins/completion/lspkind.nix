{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.completion.lspkind;
in
{
  options.modules.completion.lspkind = {
    enable = lib.mkEnableOption "Enables lspkind";
  };

  config = lib.mkIf cfg.enable {
    plugins.lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          buffer = "";
          calc = "";
          cmdline = "";
          codeium = "󱜙";
          emoji = "󰞅";
          git = "";
          luasnip = "󰩫";
          neorg = "";
          nvim_lsp = "";
          nvim_lua = "";
          path = "";
          spell = "";
          treesitter = "󰔱";
        };
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
