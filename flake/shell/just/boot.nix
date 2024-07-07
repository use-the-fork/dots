{
  perSystem = _: {
    devenv.shells.default.just.recipes.boot = {
      enable = true;
      justfile = ''
        # Rebuild the system using `nh os boot`
        boot:
          nh os boot
      '';
    };
  };
}
