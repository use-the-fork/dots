{...}: {
  imports = [
    ./firewall.nix
    ./network-manager.nix
    ./ssh.nix
    ./tailscale.nix
  ];
}
