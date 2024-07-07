{
  perSystem = _: {
    devenv.shells.default.just.recipes.bump = {
      enable = true;
      justfile = ''
        # update flake inputs commit flake lock.
        bump:
          nix flake update && git commit flake.lock -m "flake: bump inputs"
      '';
    };
  };
}
