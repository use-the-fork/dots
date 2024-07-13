{
  lib,
  config,
  ...
}: let
  inherit (lib) mkOption types mkService;
  meta = config.meta;
in {
  options.modules.system = {
    # networking
    networking = {
      services = {
        blocky = mkService {
          name = "Blocky";
          type = "dns";
          port = 4000;
          subDomain = "blocky.${meta.subDomainName}";

          extraOptions = {
            clientGroups = mkOption {
              type = types.attrsOf (types.submodule {
                options = {
                  addresses = mkOption {
                    type = types.listOf types.str;
                    description = "List of IP addresses.";
                  };
                  groupsBlock = mkOption {
                    type = types.listOf types.str;
                    description = "List of groups to block.";
                  };
                };
              });
              description = "Client groups with nested attributes: addresses and groupsBlock.";
            };
          };
        };

        unbound = mkService {
          name = "Unbound";
          type = "dns";
          port = 5335;
          subDomain = "unbound.${meta.subDomainName}";
        };
      };

      ip = {
        private = mkOption {
          type = types.str;
          default = "";
          description = ''
            The private ip of this machine.
          '';
        };

        tailscale = mkOption {
          type = types.str;
          default = "";
          description = ''
            The tailscale ip of this machine.
          '';
        };
      };
    };
  };
}
