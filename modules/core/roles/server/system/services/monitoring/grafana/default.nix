{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  sys = config.modules.system;
  cfg = sys.services;
in {
  config = mkIf cfg.monitoring.grafana.enable {
    imports = [./dashboards.nix];

    networking.firewall.allowedTCPPorts = [config.services.grafana.settings.server.http_port];

    modules.system.services.database = {
      postgresql.enable = true;
    };

    services = {
      #Enable caddy for grafana
      caddy.virtualHosts."grafana.my.lan".extraConfig = ''
        tls internal
        reverse_proxy 127.0.0.1:3000
      '';

      grafana = {
        enable = true;
        settings = {
          server = {
            http_addr = "0.0.0.0";
            http_port = 3000;

            root_url = "https://grafana.my.lan";
            domain = "grafana.my.lan";
            enforce_domain = true;
          };

          database = {
            type = "postgres";
            host = "/run/postgresql";
            name = "grafana";
            user = "grafana";
            ssl_mode = "disable";
          };

          security = {
            cookie_secure = true;
            disable_gravatar = true;
          };

          analytics = {
            reporting_enabled = false;
            check_for_updates = false;
          };

          "auth.anonymous".enabled = false;
          "auth.basic".enabled = false;

          users = {
            allow_signup = false;
          };
        };

        provision = {
          enable = true;
          datasources.settings = {
            datasources = [
              #              (mkIf sys.services.monitoring.prometheus.enable {
              #                name = "Prometheus";
              #                type = "prometheus";
              #                access = "proxy";
              #                orgId = 1;
              #                uid = "Y4SSG429DWCGDQ3R";
              #                url = "http://127.0.0.1:${toString config.services.prometheus.port}";
              #                isDefault = true;
              #                version = 1;
              #                editable = true;
              #                jsonData = {
              #                  graphiteVersion = "1.1";
              #                  tlsAuth = false;
              #                  tlsAuthWithCACert = false;
              #                };
              #              })

              #              (mkIf sys.services.monitoring.loki.enable {
              #                name = "Loki";
              #                type = "loki";
              #                access = "proxy";
              #                url = "http://127.0.0.1:${toString config.services.loki.configuration.server.http_listen_port}";
              #              })

              (mkIf sys.services.database.postgresql.enable {
                name = "PostgreSQL";
                type = "postgres";
                access = "proxy";
                url = "http://127.0.0.1:9103";
              })
            ];

            # typos go here
            deleteDatasources = [
              {
                name = "postgres";
                orgId = 0;
              }
              {
                name = "redis";
                orgId = 0;
              }
              {
                name = "Endlessh-go";
                orgId = 0;
              }
            ];
          };
        };
      };
    };
  };
}
