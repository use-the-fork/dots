{
  perSystem = _: {
    devenv.shells.default.just.recipes.switch = {
      enable = true;
      justfile = ''
        # Rebuild the system using `nh os switch`
        switch:
          nh os switch
      '';
    };
  };
}
