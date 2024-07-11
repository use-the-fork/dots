{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;

  sys = config.modules.system;
  blocky = sys.networking.services.blocky;

  mkClients = cg: builtins.mapAttrs (_name: attrs: attrs.addresses) cg;
  clients = mkClients blocky.settings.clientGroups;

  mkBlocks = cg: builtins.mapAttrs (_name: attrs: attrs.groupsBlock) cg;
  groupsBlock = mkBlocks blocky.settings.clientGroups;
in {
  config = mkIf blocky.enable {
    networking.firewall.allowedTCPPorts = [53 853];
    networking.firewall.allowedUDPPorts = [53];

    #Enable caddy for prometheus
    services.caddy.virtualHosts."${blocky.settings.subDomain}".extraConfig = ''
      import ${config.age.secrets.caddy-cloudflare-key.path}
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

        clientLookup = {
          upstream = "192.168.100.1";
          #          singleNameOrder = [
          #            "2"
          #            "1"
          #          ];
          inherit clients;
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
            hardcore = [
              "https://adaway.org/hosts.txt"
              "https://bitbucket.org/ethanr/dns-blacklists/raw/8575c9f96e5b4a1308f2f12394abd86d0927a4a0/bad_lists/Mandiant_APT1_Report_Appendix_D.txt"
              "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt"
              "https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt"
              "https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt"
              "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
              "https://phishing.army/download/phishing_army_blocklist_extended.txt"
              "https://raw.githubusercontent.com/AssoEchap/stalkerware-indicators/master/generated/hosts"
              "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt"
              "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"
              "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
              "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"
              "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts"
              "https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt"
              "https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt"
              "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
              "https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
              "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
              "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
              "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
              "https://urlhaus.abuse.ch/downloads/hostfile/"
              "https://v.firebog.net/hosts/AdguardDNS.txt"
              "https://v.firebog.net/hosts/Admiral.txt"
              "https://v.firebog.net/hosts/Easylist.txt"
              "https://v.firebog.net/hosts/Easyprivacy.txt"
              "https://v.firebog.net/hosts/Prigent-Ads.txt"
              "https://v.firebog.net/hosts/Prigent-Crypto.txt"
              "https://v.firebog.net/hosts/RPiList-Malware.txt"
              "https://v.firebog.net/hosts/RPiList-Phishing.txt"
              "https://v.firebog.net/hosts/static/w3kbl.txt"
              "https://zerodot1.gitlab.io/CoinBlockerLists/hosts_browser"
            ];
            #You can add additional categories
          };
          #Configure what block categories are used
          clientGroupsBlock = groupsBlock;
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
