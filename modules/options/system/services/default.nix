{lib, ...}: let
  inherit (lib) mkService;
in {
  imports = [
    ./databases.nix
    ./monitoring.nix
    ./networking.nix
    ./misc.nix
  ];

  options.modules.system = {
    services = {
      #      nextcloud = mkService {
      #        name = "Nextcloud";
      #        type = "cloud storage";
      #      };

      nginx = mkService {
        name = "Nginx";
        type = "webserver";
      };

      caddy = mkService {
        name = "Caddy";
        type = "webserver";
      };

      #
      #      elasticsearch = mkService {
      #        name = "Elasticsearch";
      #        port = 9200;
      #      };
      #
      #      kanidm = mkService {
      #        name = "Kanidm";
      #        port = 8443;
      #      };
    };
  };
}
