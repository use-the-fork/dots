{
  config,
  lib,
  inputs,
  inputs',
  ...
}: let
  inherit (lib.modules) mkIf;

  sys = config.modules.system;
  cfg = sys.services;
in {
  imports = [inputs.nixos-caddy-cloudflare.nixosModules.default];

  config = mkIf cfg.caddy.enable {
    services.caddy = {
      enable = true;
      package = inputs'.nixos-caddy-cloudflare.packages.default;
    };
  };
}
