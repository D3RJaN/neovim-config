{
  lib,
  ...
}:
let
  ftAttrs = name: {files."ftplugin/${name}.lua" = {
    localOpts = {
      shiftwidth = 2;
    };
  };
  };
  populateFiletypePlugin = list: lib.foldl' (a: b: a // (ftAttrs b)) {} list;
in
populateFiletypePlugin ["c" "cpp" "jinja2" "lua" "nix" "rust" "sh" "tex"]
