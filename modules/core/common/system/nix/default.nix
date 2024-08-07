{
  self,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (self) inputs;
  inherit (builtins) elem;
  inherit (lib.trivial) pipe;
  inherit (lib.types) isType;
  inherit (lib.attrsets) mapAttrsToList filterAttrs mapAttrs mapAttrs';
in {
  imports = [
    ./transcend # module that merges trees outside central nixpkgs with our system's

    ./documentation.nix # nixos documentation
    ./nixpkgs.nix # global nixpkgs configuration.nix
    ./system.nix # nixos system configuration
  ];

  environment.etc = let
    inherit (config.nix) registry;
    commonPaths = ["home-manager" "nixpkgs"];
  in
    pipe registry [
      (filterAttrs (name: _: (elem name commonPaths)))
      (mapAttrs' (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      }))
    ];

  nix = let
    mappedRegistry = pipe inputs [
      (filterAttrs (_: isType "flake"))
      (mapAttrs (_: flake: {inherit flake;}))
      (flakes: flakes // {nixpkgs.flake = inputs.nixpkgs;})
    ];
  in {
    # Lix, the higher performance Nix fork.
    package = pkgs.lix;

    # Pin the registry to avoid downloading and evaluating
    # a new nixpkgs version on each command causing a re-eval.
    # This will add each flake input as a registry and make
    # nix3 commands consistent with your flake.
    registry = mappedRegistry // {default-flake = mappedRegistry.nixpkgs;};

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well
    nixPath = mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    # make builds run with low priority so my system stays responsive
    # this is especially helpful if you have auto-upgrade on
    daemonCPUSchedPolicy = "batch";
    daemonIOSchedClass = "idle";
    daemonIOSchedPriority = 7;

    # set up garbage collection to run weekly,
    # removing unused packages that are older than 30 days
    gc = {
      automatic = true;
      dates = "Sat *-*-* 03:00";
      options = "--delete-older-than 30d";
      persistent = false; # don't try to catch up on missed GC runs
    };

    # automatically optimize nix store my removing hard links
    # do it after the gc
    optimise = {
      automatic = true;
      dates = ["04:00"];
    };

    settings = {
      # tell nix to use the xdg spec for base directories
      # while transitioning, any state must be carried over
      # manually, as Nix won't do it for us
      use-xdg-base-directories = true;

      # Allow usage of registry lookups (e.g. flake:*) but
      # disallow internal flake registry by setting it to
      # to a minimal JSON file with no flakes and a version
      # identifier.
      use-registries = true;
      flake-registry = pkgs.writeText "flakes-empty.json" (builtins.toJSON {
        flakes = [];
        version = 2;
      });

      # Free up to 10GiB whenever there is less than 5GB left.
      # this setting is in bytes, so we multiply with 1024 thrice
      min-free = "${toString (5 * 1024 * 1024 * 1024)}";
      max-free = "${toString (10 * 1024 * 1024 * 1024)}";

      # automatically optimise symlinks
      auto-optimise-store = true;

      # allow sudo users to mark the following values as trusted
      allowed-users = ["root" "@wheel" "nix-builder"];

      # only allow sudo users to manage the nix store
      trusted-users = ["root" "@wheel" "nix-builder"];

      # let the system decide the number of max jobs
      max-jobs = "auto";

      # build inside sandboxed environments
      sandbox = true;
      sandbox-fallback = false;

      # supported system features
      system-features = ["nixos-test" "kvm" "recursive-nix" "big-parallel"];

      # extra architectures supported by my builders
      extra-platforms = config.boot.binfmt.emulatedSystems;

      # Continue building derivations even if one fails
      keep-going = true;

      # Fallback to local builds after remote builders are unavailable.
      # Setting this too low on a slow network may cause remote builders
      # to be discarded before a connection can be established.
      connect-timeout = 5;

      # If we haven't received data for >= 20s, retry the download
      stalled-download-timeout = 20;

      # Show more logs when a build fails and decides to display
      # a bunch of lines. `nix log` would normally provide more
      # information, but this may save us some time and keystrokes.
      log-lines = 30;

      # enable new nix command and flakes
      # and also "unintended" recursion as well as content addressed nix
      extra-experimental-features = [
        "flakes" # flakes
        "nix-command" # experimental nix commands
        "recursive-nix" # let nix invoke itself
        "ca-derivations" # content addressed nix
        "auto-allocate-uids" # allow nix to automatically pick UIDs, rather than creating nixbld* user accounts
        "cgroups" # allow nix to execute builds inside cgroups
        "repl-flake" # allow passing installables to nix repl
        "no-url-literals" # disallow deprecated url-literals, i.e., URLs without quotation
        "dynamic-derivations" # allow "text hashing" derivation outputs, so we can build .drv files.
      ];

      # don't warn me that my git tree is dirty, I know
      warn-dirty = false;

      # maximum number of parallel TCP connections used to fetch imports and binary caches, 0 means no limit
      http-connections = 0;

      # whether to accept nix configuration from a flake without prompting
      accept-flake-config = false;

      # execute builds inside cgroups
      use-cgroups = true;

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      # use binary cache, this is not gentoo
      # external builders can also pick up those substituters
      builders-use-substitutes = true;

      # substituters to use
      substituters = [
        "https://cache.nixos.org" # funny binary cache
        "https://nixpkgs-wayland.cachix.org" # automated builds of *some* wayland packages
        "https://nix-community.cachix.org" # nix-community cache
        "https://hyprland.cachix.org" # hyprland
        "https://nixpkgs-unfree.cachix.org" # unfree-package cache
        "https://numtide.cachix.org" # another unfree package cache
        "https://anyrun.cachix.org" # anyrun program launcher
        "https://cache.garnix.io" # garnix binary cache, hosts prismlauncher
        "https://ags.cachix.org" # ags
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
    };
  };
}
