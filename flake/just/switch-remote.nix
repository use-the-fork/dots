{
  perSystem = _: {
    just-flake.features.switch-remote = {
      enable = true;
      justfile = ''
        # run a rebuild on a remote system.
        switch-remote target_system:
          set -euo pipefail

          # Call nixos-rebuild on remote system
          sudo nixos-rebuild switch \
          --flake ".#{{target_system}}" \
          --target-host "{{target_system}}"
      '';
    };
  };
}
