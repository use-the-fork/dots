{
  perSystem = _: {
    just-flake.features.bump = {
      enable = true;
      justfile = ''
        # update flake inputs commit flake lock.
        bump:
          nix flake update && git commit flake.lock -m "flake: bump inputs"
      '';
    };
  };
}
