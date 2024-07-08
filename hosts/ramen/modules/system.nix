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

      services = {
        blocky = {
          enable = true;
          settings.clientGroups = {
            lisa = {
              addresses = [
                "192.168.100.200" #Lisa - Iphone
                "192.168.100.228" #Lisa - MacBook
              ];
              groupsBlock = [];
            };
            home-server = {
              addresses = [
                "192.168.100.212"
              ];
              groupsBlock = [];
            };

            sincore = {
              addresses = [
                "192.168.100.214" #Sushi
              ];
              groupsBlock = [];
            };

            televisions = {
              addresses = [
                "192.168.100.152" #Sheild - Bedroom
              ];
              groupsBlock = [
                "ads"
                "adult"
                "hardcore"
              ];
            };
          };
        };
        unbound.enable = false;
      };
    };

    virtualization = {
      enable = true;
      docker.enable = true;
      qemu.enable = false;
      podman.enable = false;
    };

    services = {
      caddy.enable = true;

      monitoring = {
        prometheus = {
          enable = true;
        };
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
