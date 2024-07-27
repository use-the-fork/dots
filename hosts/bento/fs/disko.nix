{
  disko.devices = {
    disk.main = {
      type = "disk";
      # When using disko-install, we will overwrite this value from the commandline
      device = "/dev/nvme0n1"; # The device to partition
      content = {
        type = "gpt";
        partitions = {
          # The EFI & Boot partition
          ESP = {
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "defaults"
              ];
            };
          };
          # The root partition
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = ["-f"]; # Force override existing partition
              subvolumes = {
                "@" = {
                  mountpoint = "/";
                  # we can access all other subvolumes from this subvolume.
                  mountOptions = ["defaults" "compress=zstd:1" "ssd" "noatime" "nodiratime"];
                };

                "@home" = {
                  mountpoint = "/home";
                  mountOptions = ["defaults" "compress=zstd:1" "ssd" "noatime" "nodiratime"];
                };

                "@nix" = {
                  mountpoint = "/nix";
                  mountOptions = ["defaults" "compress=zstd:1" "ssd" "noatime" "nodiratime"];
                };

                "@swap" = {
                  mountpoint = "/.swap";
                  mountOptions = ["defaults" "x-mount.mkdir" "ssd" "noatime" "nodiratime"];
                };
              };
            };
          };
        };
      };
    };
  };
}
