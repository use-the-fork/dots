{
  modules.system = {
    mainUser = "sincore";
    fs = ["btrfs" "ext4" "vfat" "ntfs"];
    autoLogin = true;

    boot = {
      loader = "systemd-boot";
      enableKernelTweaks = true;
      initrd.enableTweaks = true;
      loadRecommendedModules = true;
      tmpOnTmpfs = true;
    };

    video.enable = true;
    sound.enable = false;
    bluetooth.enable = false;

    networking = {
      tailscale = {
        enable = true;
        autoConnect = true;
      };
      blocky.enable = true;
    };
    virtualization = {
      enable = true;
      docker.enable = true;
      qemu.enable = false;
      podman.enable = false;
    };

    services = {
      nginx.enable = false;
      caddy.enable = true;

      monitoring = {
        prometheus.enable = true;
        grafana.enable = true;
      };
      database = {
        mysql.enable = true;
        postgresql.enable = true;
      };
    };

    programs = {
      cli.enable = true;

      default = {
        terminal = "kitty";
      };
    };
  };
}
