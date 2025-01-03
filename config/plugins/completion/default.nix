{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.completion;
in
{

  imports = [
    ./cmp.nix
    ./lspkind.nix
  ];

  options.modules.completion.enable = lib.mkEnableOption "Enables completion";

  config.modules.completion = lib.mkIf cfg.enable {
    cmp.enable = lib.mkDefault true;
    lspkind.enable = lib.mkDefault true;
  };
}
