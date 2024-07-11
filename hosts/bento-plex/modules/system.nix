{
  modules.system = {
    mainUser = "sincore";
    fs = ["btrfs" "ext4" "vfat" "ntfs"];
    autoLogin = true;

    boot = {
      #      loader = "systemd-boot";
      enableKernelTweaks = false;
      initrd.enableTweaks = false;
      loadRecommendedModules = true;
      tmpOnTmpfs = true;
    };

    networking = {
      tailscale = {
        enable = true;
        autoConnect = true;
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
