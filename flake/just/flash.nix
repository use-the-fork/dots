{
  perSystem = _: {
    just-flake.features.flash = {
      enable = true;
      justfile = ''
        # flash a clean install to remote system.
        @flash target_system ip password:
          set -euo pipefail

          if [ -n "{{password}}" ]; then
            # Write your disk encryption password to a file
            echo "{{password}}" > /tmp/disk.key
            disk_encryption_keys="--disk-encryption-keys /tmp/disk.key /tmp/disk.key"
          else
            disk_encryption_keys=""
          fi

          # Call nixos-anywhere with optional disk encryption keys
          nixos-anywhere \
            $disk_encryption_keys \
            --flake ".#{{target_system}}" \
            root@{{ip}}
      '';
    };
  };
}
