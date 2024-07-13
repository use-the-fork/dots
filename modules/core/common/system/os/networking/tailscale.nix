{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf mkDefault;
  inherit (config.services) tailscale;

  sys = config.modules.system;
  cfg = sys.networking.tailscale;
in {
  config = mkIf cfg.enable {
    # Allow all system users to use the `tailscale` command
    # by adding the package used by the tailscale service
    # to their PATH.
    environment.systemPackages = [tailscale.package];

    networking.firewall = {
      # Always allow traffic from the designated tailscale interface
      trustedInterfaces = ["${tailscale.interfaceName}"];
      checkReversePath = "loose";

      # Allow tailscale over UDP
      allowedUDPPorts = [tailscale.port];
    };

    boot.kernel.sysctl = {
      # Enable IP forwarding
      # required for Wireguard & Tailscale/Headscale subnet feature
      # Technically, not all hosts do need to be able to IP forward but this could potentially
      # come in handy when I need to turn a host into an exit node.
      # See:
      #  <https://tailscale.com/kb/1019/subnets/?tab=linux#step-1-install-the-tailscale-client>
      "net.ipv4.ip_forward" = true;
      "net.ipv6.conf.all.forwarding" = true;
    };

    # Enable Tailscale, the inter-machine VPN service
    # with our Headscale coordination server.
    services.tailscale = {
      enable = true;
      permitCertUid = "caddy";
      useRoutingFeatures = mkDefault "both";
      # TODO: these flags still need to be specified with `tailscale up`
      # for some reason
      extraUpFlags = cfg.flags.final;
    };
  };
}
