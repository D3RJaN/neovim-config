{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.completion.cmp;
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in
{
  options.modules.completion.cmp = {
    enable = lib.mkEnableOption "Enables cmp";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          preselect = # Lua
          "cmp.PreselectMode.None";

          sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_signature_help";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "treesitter";
            priority = 850;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "buffer";
            priority = 500;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "rg";
            priority = 300;
          }
          {
            name = "path";
            priority = 300;
          }
          ];

          completion.completeopt = "menu,menuone,preview,noselect";

          # Enable pictogram icons for lsp/autocompletion
          formatting = {
            fields = [
              "abbr"
              "menu"
              "kind"
            ];
            expandable_indicator = true;
          };

          performance = {
            debounce = 60;
            fetching_timeout = 200;
            max_view_entries = 30;
          };

          #window = {
          #  completion = {
          #    border = "rounded";
          #    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          #  };
          #  documentation = {
          #    border = "rounded";
          #  };
          #};

          mapping = {
            "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
            "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-y>" = ''cmp.mapping(
                cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
                },
                { "i", "c" }
                )'';
            "<Tab>" = "cmp.config.disable";
          };
        };
      };
    };
    extraConfigLua = ''
    kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }
    '';
  };
}
