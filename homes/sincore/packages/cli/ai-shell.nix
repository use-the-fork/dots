{
  osConfig,
  config,
  lib,
  pkgs,
  inputs',
  ...
}: let
  inherit (lib) mkIf;
  inherit (osConfig) modules;

  prg = modules.system.programs;
in {
  config = mkIf prg.cli.enable {
    home = {
      packages = with pkgs; [
        inputs'.ai-shell.packages.default
      ];
      file = {
        ".ai-shell".source = config.lib.file.mkOutOfStoreSymlink osConfig.age.secrets.ai-shell.path;
      };
    };
  };
}
