{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf config.modules.system.networking.blocky.enable {
    services.blocky = {
      enable = true;
      settings = {
        port = 53; # Port for incoming DNS Queries.
        upstream.default = [
          "1.1.1.1"
          "8.8.8.8"
        ];
        # For initially solving DoH/DoT Requests when no system Resolver is available.
        bootstrapDns = {
          upstream = "1.1.1.1";
          ips = ["1.1.1.1" "8.8.8.8"];
        };
        # My custom entries for local network
        customDNS = {
          customTTL = "1h";
          mapping = {
            "dash.my.lan" = "100.68.105.44";
            "grafana.my.lan" = "100.68.105.44";
          };
        };
        # Redirect all .lan queries to the router
        #        conditional = {
        #          mapping = {
        #            lan = "10.69.1.1";
        #          };
        #        };
        #Enable Blocking of certian domains.
        blocking = {
          blackLists = {
            #Adblocking
            ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
            #Another filter for blocking adult sites
            adult = ["https://blocklistproject.github.io/Lists/porn.txt"];
            #You can add additional categories
          };
          #Configure what block categories are used
          clientGroupsBlock = {
            default = ["ads"];
            kids-ipad = ["ads" "adult"];
          };
        };
        prometheus.enable = true;
        caching = {
          minTime = "5m";
          maxTime = "30m";
          prefetching = true;
        };
      };
    };
  };
}
