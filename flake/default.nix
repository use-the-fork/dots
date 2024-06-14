# NOTE: The role of this file is to bootstrap the
# RoboNix library. There is some duplication shared between this
# file and the library itself due to the library needing to pass through
# another extended library for its own applications.
core-inputs: user-options: let
  robo-nix-config = {
    src = user-options.src;
    namespace = "robo-nix";
    meta = {
      name = raw-snowfall-config.meta.name or null;
      title = raw-snowfall-config.meta.title or null;
    };
  };

  user-inputs = user-options.inputs // {src = user-options.src;};

  inherit (core-inputs.nixpkgs.lib) assertMsg fix filterAttrs mergeAttrs fold recursiveUpdate;

  # Recursively merge a list of attribute sets.
  # Type: [Attrs] -> Attrs
  # Usage: merge-deep [{ x = 1; } { x = 2; }]
  #   result: { x = 2; }
  merge-deep = fold recursiveUpdate {};

  # Merge the root of a list of attribute sets.
  # Type: [Attrs] -> Attrs
  # Usage: merge-shallow [{ x = 1; } { x = 2; }]
  #   result: { x = 2; }
  merge-shallow = fold mergeAttrs {};

  # Transform an attribute set of inputs into an attribute set where
  # the values are the inputs' `lib` attribute. Entries without a `lib`
  # attribute are removed.
  # Type: Attrs -> Attrs
  # Usage: get-lib { x = nixpkgs; y = {}; }
  #   result: { x = nixpkgs.lib; }
  get-libs = attrs: let
    # @PERF(jakehamilton): Replace filter+map with a fold.
    attrs-with-libs =
      filterAttrs
      (_name: value: builtins.isAttrs (value.lib or null))
      attrs;
    libs =
      builtins.mapAttrs (_name: input: input.lib) attrs-with-libs;
  in
    libs;

  # Remove the `self` attribute from an attribute set.
  # Type: Attrs -> Attrs
  # Usage: without-self { self = {}; x = true; }
  #   result: { x = true; }
  without-self = attrs: builtins.removeAttrs attrs ["self"];

  core-inputs-libs = get-libs (without-self core-inputs);

  #  # NOTE: This root is different to accommodate the creation
  #  # of a fake user-lib in order to run documentation on this flake.
  #  snowfall-lib-root = "${core-inputs.src}/snowfall-lib";
  #  snowfall-lib-dirs = let
  #    files = builtins.readDir snowfall-lib-root;
  #    dirs = filterAttrs (name: kind: kind == "directory") files;
  #    names = builtins.attrNames dirs;
  #  in
  #    names;

  robo-nix-lib = fix (
    robo-nix-lib: let
      attrs = {
        inherit robo-nix-lib robo-nix-config core-inputs;
      };
      libs =
        builtins.map
        (dir: import "${snowfall-lib-root}/${dir}" attrs)
        snowfall-lib-dirs;
    in
      merge-deep libs
  );

  base-lib = merge-shallow [
    #    core-inputs.nixpkgs.lib
    core-inputs-libs
    #    snowfall-top-level-lib
    {robo-nix = robo-nix-lib;}
  ];

  lib = merge-deep [
    base-lib
  ];

  user-inputs-has-self = builtins.elem "self" (builtins.attrNames user-inputs);
  user-inputs-has-src = builtins.elem "src" (builtins.attrNames user-inputs);
in
  assert (assertMsg user-inputs-has-self "Missing attribute `self` for mkLib.");
  assert (assertMsg user-inputs-has-src "Missing attribute `src` for mkLib."); lib
