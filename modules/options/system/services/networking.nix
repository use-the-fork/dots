{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkOption types mkService;
  meta = config.meta;

  mkEnableOption' = desc: mkEnableOption "${desc}" // {default = true;};
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
            clientGroups = {
              default = mkOption {
                type = types.listOf types.str;
                default = [];
                description = "The IPs of clients that should be in the default blocklist.";
              };
              kid = mkOption {
                type = types.listOf types.str;
                default = [];
                description = "The IPs of clients that should be in the kid blocklist.";
              };
              hardcore = mkOption {
                type = types.listOf types.str;
                default = [];
                description = "The IPs of clients that should be in the hardcore blocklist.";
              };
              noBlocky = mkOption {
                type = types.listOf types.str;
                default = [];
                description = "The IPs of clients that shouldn't be blocked.";
              };
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

      tailscale = {
        enable = mkEnableOption' "Tailscale";
        manageSSH = mkEnableOption' "Set tailscale to manage connections";
        autoConnect = mkEnableOption "Autoconnect to tailscale";
      };
    };
  };
}
