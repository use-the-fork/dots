{
  lib,
  config,
  ...
}: let
  inherit (lib.modules) mkDefault;
in {
  #We turn on SSH for initrd to allow us to unlock a luks encypted server on boot.
  config = {
    boot.initrd.network.ssh = {
      # enable openssh on boot
      enable = true;

      hostKeys = mkDefault [
        {
          bits = 4096;
          path = "/etc/ssh/ssh_host_rsa_key";
          type = "rsa";
        }
        {
          bits = 4096;
          path = "/etc/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
      ];
    };
  };
}
