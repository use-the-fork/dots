{
  perSystem = _: {
    just-flake.features.switch = {
      enable = true;
      justfile = ''
        # Rebuild the system using `nh os switch`
        switch:
          nh os switch
      '';
    };
  };
}
