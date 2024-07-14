{
  self,
  pkgs,
  config,
  ...
}: let
  keys = [
    self.keys.main
  ];
  sys = config.modules.system;
in {
  config = {
    boot.initrd.network.ssh.authorizedKeys = keys;

    users.users."${sys.mainUser}" = {
      isNormalUser = true;

      # Home directory
      createHome = true;
      home = "/home/${sys.mainUser}";

      shell = pkgs.zsh;
      initialPassword = "changeme";
      openssh.authorizedKeys.keys = keys;
      extraGroups = [
        "wheel"
        "systemd-journal"
        "audio"
        "video"
        "input"
        "plugdev"
        "lp"
        "tss"
        "power"
        "nix"
        "network"
        "networkmanager"
        "wireshark"
        "mysql"
        "docker"
        "podman"
        "git"
        "libvirtd"
        "caddy"
        "unbound"
      ];
    };
  };
}
