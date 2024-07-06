{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  sys = config.modules.system;
  cfg = sys.services;
  #  inherit (config.networking) domain;
in {
  config = mkIf cfg.caddy.enable {
    services.caddy = {
      enable = true;
    };
  };
}
