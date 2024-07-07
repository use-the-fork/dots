{lib, ...}: let
  inherit (lib) mkEnableOption mkOption types;

  mkEnableOption' = desc: mkEnableOption "${desc}" // {default = true;};
in {
  options.modules.system = {
    # networking
    networking = {
      blocky.enable = mkEnableOption "Blocky";

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
