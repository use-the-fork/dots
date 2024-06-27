{
  osConfig,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (osConfig) modules;

  sys = modules.system;
  prg = sys.programs;
in {
  config = mkIf prg.realvnc-vnc-viewer.enable {
    home.packages = with pkgs; [
      realvnc-vnc-viewer
    ];
  };
}
