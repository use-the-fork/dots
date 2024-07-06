{
  config,
  lib,
  ...
}: let
  inherit (lib) types;
  inherit (lib.options) mkOption;

  env = config.modules.usrEnv;
in {
  options.meta = {
    hostname = mkOption {
      type = types.str;
      default = config.networking.hostName;
      readOnly = true;
      description = ''
        The canonical hostname of the machine.

        Is usually used to identify - i.e name machines internally
        or on the same Headscale network. This option must be declared
        in `hosts.nix` alongside host system.
      '';
    };

    domainName = mkOption {
      type = types.str;
      default = config.networking.domainName;
      readOnly = true;
      description = ''
        The primary domain used for local network operations.

        Setting this option defines the network domain name under
        which all local services and machines will be addressed.
      '';
    };

    subDomainName = mkOption {
      type = types.str;
      default = "${config.networking.domainName}.${config.networking.hostName}";
      readOnly = true;
      description = ''
        The primary sub domain used for local network operations.
      '';
    };

    ip = {
      private = mkOption {
        type = types.str;
        default = config.networking.ip.private;
        readOnly = true;
        description = ''
          The private ip of this machine.
        '';
      };
      tailscale = mkOption {
        type = types.str;
        default = config.networking.ip.tailscale;
        readOnly = true;
        description = ''
          The tailscale ip of this machine.
        '';
      };
    };

    system = mkOption {
      type = types.str;
      default = config.system.build.toplevel.system;
      readOnly = true;
      description = ''
        The architecture of the machine.
      '';
    };

    isWayland = mkOption {
      type = types.bool;
      # TODO: there must be a better way to do this
      default = with env.desktops; hyprland.enable;
      # readOnly = true; # TODO
      description = ''
        Whether to enable Wayland exclusive modules, this contains a wariety
        of packages, modules, overlays, XDG portals and so on.

        Generally includes:
          - Wayland nixpkgs overlay
          - Wayland only services
          - Wayland only programs
          - Wayland compatible versions of packages as opposed
          to the defaults
      '';
    };
  };
}
