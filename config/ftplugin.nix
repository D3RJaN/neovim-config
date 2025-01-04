let
  fileTypes = ["c" "cpp" "jinja2" "lua" "nix" "rust" "sh" "tex"];
  genericOptions = {
    localOpts = {
      shiftwidth = 2;
    };
  };
  buildNameValueAttrs = builtins.map (ft: {name = "ftplugin/${ft}.lua"; value = genericOptions;}) fileTypes;
in 
{
  files = builtins.listToAttrs buildNameValueAttrs;
}
