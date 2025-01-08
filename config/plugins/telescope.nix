{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.telescope;
  keymaps = {
    "<leader>ff" = {
      action = "find_files";
      options.desc = "Fuzzy find files in cwd";
    };
    "<leader>fr" = {
      action = "oldfiles";
      options.desc = "Fuzzy find recent files";
    };
    "<leader>fs" = {
      action = "live_grep";
      options.desc = "Find string in cwd";
    };
    "<leader>fc" = {
      action = "grep_string";
      options.desc = "Find string under cursor in cwd";
    };
    "<C-p>" = {
      action = "git_files";
      options.desc = "Search git files";
    };
    "<leader>gc" = {
      action = "git_commits";
      options.desc = "Commits";
    };
    "<leader>gs" = {
      action = "git_status";
      options.desc = "Status";
    };
  };
in
{
  options.modules.telescope.enable = lib.mkEnableOption "Enables telescope";

  config = lib.mkIf cfg.enable {
    # Dependency:
    modules.web-devicons.enable = true;

    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            fuzzy = true;
            override_generic_sorter = true;
            override_file_sorter = true;
            case_mode = "smart_case";
          };
        };
        ui-select = {
          enable = true;
          settings = {
            specific_opts = {
              codeactions = true;
            };
          };
        };
      };
      inherit keymaps;
    };
  };
}
