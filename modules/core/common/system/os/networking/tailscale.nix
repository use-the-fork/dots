{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkMerge optional;
  inherit (config.services) tailscale;
  cfg = config.modules.system.networking.tailscale;
in {
  config = mkIf cfg.enable (mkMerge [
    {
      # make the tailscale command usable to users
      environment.systemPackages = [pkgs.tailscale];

      services.tailscale = {
        enable = true;
        extraUpFlags = optional cfg.manageSSH "--ssh";
        permitCertUid = "caddy";
      };
      networking.firewall = {
        trustedInterfaces = ["${tailscale.interfaceName}"];
        checkReversePath = "loose";
        allowedUDPPorts = [config.services.tailscale.port];
      };
    }
    (mkIf cfg.autoConnect {
      # Autoconnect
      services.tailscale.authKeyFile = config.age.secrets.tailscale-client.path;
    })
  ]);
}
