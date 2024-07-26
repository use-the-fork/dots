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
      plymouth.enable = true;
    };

    video.enable = true;
    sound.enable = true;
    bluetooth.enable = false;
    printing.enable = true;
    printing."3d".enable = true;

    security = {
      fprint.enable = true;
    };

    virtualization = {
      enable = true;
      docker.enable = true;
      qemu.enable = false;
      podman.enable = false;
    };

    networking = {
      tailscale = {
        enable = true;
        isServer = false;
        isClient = true;
      };
    };

    services = {
      flatpak = {
        enable = false;
        packages = [
          "flathub:app/com.nordpass.NordPass//stable"
        ];
      };
    };

    programs = {
      cli.enable = true;
      gui.enable = true;
      dev.enable = true;

      git = {
        userName = "use-the-fork";
        userEmail = "sincore@gmail.com";
      };

      chromium.enable = false;
      google-chrome.enable = true;
      signal-desktop.enable = true;
      gimp.enable = true;
      realvnc-vnc-viewer.enable = true;

      default = {
        terminal = "foot";
      };
    };
  };
}
