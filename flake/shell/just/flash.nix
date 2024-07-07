{
  perSystem = _: {
    devenv.shells.default.just.recipes.flash = {
      enable = true;
      justfile = ''
        # flash a clean install to remote system.
        flash target_system ip password:
          set -euo pipefail

          # Write your disk encryption password to a file
          echo "{{password}}" > /tmp/disk.key

          # Call nixos-anywhere with disk encryption keys
          nixos-anywhere \
            --disk-encryption-keys /tmp/disk.key /tmp/disk.key \
            --flake ".#{{target_system}}" \
            root@{{ip}}
      '';
    };
  };
}
