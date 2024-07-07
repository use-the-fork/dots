{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  sys = config.modules.system;
  unbound = sys.networking.services.unbound;
in {
  config = mkIf unbound.enable {
    #Enable caddy for prometheus
    services.caddy.virtualHosts."${unbound.settings.subDomain}".extraConfig = ''
      import ${config.sops.templates.cf-tls.path}
      reverse_proxy ${unbound.settings.host}:${builtins.toString unbound.settings.port}
    '';

    services.unbound = {
      enable = true;
      enableRootTrustAnchor = true;
      resolveLocalQueries = false;

      settings = {
        server = {
          interface = ["127.0.0.1"];
          port = unbound.settings.port;

          # Custom DNS
          local-zone = [
            "headscale.nelim.org redirect"
            "git.nelim.org redirect"
            "mc.nelim.org transparent"
            "cv.nelim.org transparent"
            "mc2.nelim.org transparent"
            "ota.nelim.org redirect"
            "nelim.org redirect"
          ];
          local-data = let
            wanIP = "166.62.179.208";
          in [
            "\"headscale.nelim.org. IN A ${wanIP}\""

            "\"git.nelim.org. IN A ${wanIP}\""

            "\"mc.nelim.org IN A 100.64.0.7\""
            "\"_minecraft._tcp.mc.nelim.org. 180 IN SRV 0 0 25569 mc.nelim.org.\""

            "\"cv.nelim.org IN A 100.64.0.7\""
            "\"_minecraft._tcp.cv.nelim.org. 180 IN SRV 0 0 25566 cv.nelim.org.\""

            "\"mc2.nelim.org IN A 100.64.0.7\""
            "\"_minecraft._tcp.mc2.nelim.org. 180 IN SRV 0 0 25560 mc2.nelim.org.\""

            "\"ota.nelim.org. IN A 100.64.0.5\""
          ];

          do-ip4 = true;
          do-ip6 = false;
          prefer-ip6 = false;
          do-udp = true;
          do-tcp = true;

          # Performance
          prefetch = true;
          num-threads = 1;

          private-address = [
            "172.16.0.0/12"
            "10.0.0.0/8"
            "100.64.0.0/8"
            "fd00::/8"
            "fe80::/10"
          ];

          # Default stuff
          harden-glue = true;
          harden-dnssec-stripped = true;
          use-caps-for-id = false;
          edns-buffer-size = 1232;
          so-rcvbuf = "1m";
        };
      };
    };
  };
}
