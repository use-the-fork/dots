{
  config,
  lib,
  ...
}: let
  inherit (lib) mkAgenixSecret;

  sys = config.modules.system;
  cfg = sys.services;
in {
  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "/home/${sys.mainUser}/.ssh/id_ed25519"
  ];

  age.secrets = {
    tailscale-client = mkAgenixSecret true {
      file = "client/tailscale.age";
      owner = sys.mainUser;
      group = "users";
      mode = "400";
    };

    caddy-cloudflare-key = mkAgenixSecret cfg.caddy.enable {
      file = "service/caddy-cloudflare.age";
      mode = "400";
      owner = "caddy";
      group = "caddy";
    };
  };
}
