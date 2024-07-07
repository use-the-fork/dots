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

    sops.secrets.cf-tls = {
      sopsFile =
        lib.fs.get-file "secrets/networking/cloudflare.yaml";
      owner = "caddy";
      group = "caddy";
      restartUnits = ["caddy.service"];
    };

    sops.templates.cf-tls = {
      content = ''
        tls {
          dns cloudflare ${config.sops.placeholder.cf-tls}
        }
      '';
      owner = "caddy";
      group = "caddy";
    };
  };
}
