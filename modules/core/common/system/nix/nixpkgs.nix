_: {
  # Global nixpkgs configuration. This is ignored if nixpkgs.pkgs is set
  # which is a case that should be avoided. Everything that is set to configure
  # nixpkgs must go here.
  nixpkgs = {
    # Configuration reference:
    # <https://nixos.org/manual/nixpkgs/unstable/#chap-packageconfig>
    config = {
      allowBroken = false;
      allowUnsupportedSystem = true;

      # really a pain in the ass to deal with when disabled
      allowUnfree = true;

      # default to none, add more as necessary
      permittedInsecurePackages = [];

      # disable the usage of nixpkgs aliases in the configuration
      allowAliases = true;

      # Enable parallel building by default. This, in theory, should speed up building
      # derivations, especially rust ones. However setting this to true causes a mass rebuild
      # of the *entire* system closure, so it must be handled with proper care.
      enableParallelBuildingByDefault = false;

      # List of derivation warnings to display while rebuilding.
      #  See: <https://github.com/NixOS/nixpkgs/blob/master/pkgs/stdenv/generic/check-meta.nix>
      # NOTE: "maintainerless" can be added to emit warnings
      # about packages without maintainers but it seems to me
      # like there are more packages without maintainers than
      # with maintainers, so it's disabled for the time being.
      showDerivationWarnings = [];
    };
  };
}
