{
  perSystem = _: {
    just-flake.features.test = {
      enable = true;
      justfile = ''
        # Rebuild the system using `nh os test`
        test:
          nh os test
      '';
    };
  };
}
