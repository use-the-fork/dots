{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  sys = config.modules.system;
  blocky = sys.networking.services.blocky;
in {
  config = mkIf blocky.enable {
    networking.firewall.allowedTCPPorts = [53 853];
    networking.firewall.allowedUDPPorts = [53];

    #Enable caddy for prometheus
    services.caddy.virtualHosts."${blocky.settings.subDomain}".extraConfig = ''
      import ${config.sops.templates.cf-tls.path}
      reverse_proxy ${blocky.settings.host}:${builtins.toString blocky.settings.port}
    '';

    services.blocky = {
      enable = true;
      settings = {
        upstream.default = [
          "tcp-tls:1.1.1.1:853"
          "tcp-tls:1.0.0.1:853"
          "https://1.1.1.1/dns-query"
          "https://1.0.0.1/dns-query"
          "https://dns11.quad9.net/dns-query"
        ];
        # For initially solving DoH/DoT Requests when no system Resolver is available.
        bootstrapDns = {
          upstream = "https://dns11.quad9.net/dns-query";
          ips = ["9.9.9.9"];
        };

        clientLookup.clients = {
          default = blocky.settings.clientGroups.default;
          kid = blocky.settings.clientGroups.kid;
          hardcore = blocky.settings.clientGroups.hardcore;
          noBlocky = blocky.settings.clientGroups.noBlocky;
        };

        # My custom entries for local network
        customDNS = {
          customTTL = "1h";
          mapping = {
            #            "prometheus.ramen.isdelicio.us" = "100.68.105.44";
            #            "grafana.ramen.isdelicio.us" = "100.68.105.44";
          };
        };
        #Enable Blocking of certian domains.
        blocking = {
          blackLists = {
            #Adblocking
            ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
            adult = ["https://blocklistproject.github.io/Lists/porn.txt"];
            #You can add additional categories
          };
          #Configure what block categories are used
          clientGroupsBlock = {
            default = ["ads"];
            kid = ["ads" "adult"];
            hardcore = ["ads" "adult"];
            noBlocky = [];
          };
        };
        prometheus.enable = true;
        caching = {
          minTime = "5m";
          maxTime = "30m";
          prefetching = true;
        };
        ports = {
          dns = 53; # Port for incoming DNS Queries.
          tls = 853;
          http = "${blocky.settings.host}:${builtins.toString blocky.settings.port}";
        };
      };
    };
  };
}
