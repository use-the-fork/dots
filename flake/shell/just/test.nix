{
  perSystem = _: {
    devenv.shells.default.just.recipes.test = {
      enable = true;
      justfile = ''
        # Rebuild the system using `nh os test`
        test:
          nh os test
      '';
    };
  };
}
