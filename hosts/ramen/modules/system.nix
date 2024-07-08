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
            sushi = {
              addresses = [
                "192.168.100.214" #Sushi
              ];
              groupsBlock = [];
            };

            greg-phone = {
              addresses = [
                "192.168.100.3"
              ];
              groupsBlock = [];
            };

            lisa-iphone = {
              addresses = [
                "192.168.100.200" #Lisa - Iphone
              ];
              groupsBlock = [];
            };

            lisa-macbook = {
              addresses = [
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

            envisalink = {
              addresses = [
                "192.168.100.234"
              ];
              groupsBlock = [];
            };

            tempura = {
              addresses = [
                "192.168.100.189"
              ];
              groupsBlock = [];
            };

            emma-tablet = {
              addresses = [
                "192.168.100.48" #Tablet
              ];
              groupsBlock = [
                "ads"
                "adult"
              ];
            };

            emma-phone = {
              addresses = [
                "192.168.100.42" #Phone
              ];
              groupsBlock = [
                "ads"
                "adult"
              ];
            };

            sheild-bedroom = {
              addresses = [
                "192.168.100.152" #Sheild - Bedroom
              ];
              groupsBlock = [
                "ads"
                "adult"
                "hardcore"
              ];
            };

            eero = {
              addresses = [
                "192.168.100.95"
                "192.168.100.246"
                "192.168.100.248"
              ];
              groupsBlock = [];
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
