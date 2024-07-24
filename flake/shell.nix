{
  perSystem = {
    inputs',
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShellNoCC {
      name = "nix";
      meta.description = ''
        The default development shell for my NixOS configuration
      '';

      # Set up pre-commit hooks when user enters the shell.
      shellHook = ''
        ${config.pre-commit.installationScript}
      '';

      # Tell Direnv to shut up.
      DIRENV_LOG_FORMAT = "";

      # Receive packages from treefmt's configured devShell.
      inputsFrom = [
        config.treefmt.build.devShell
        config.just-flake.outputs.devShell
      ];
      packages = [
        # Packages provided by flake inputs
        inputs'.agenix.packages.default # agenix CLI for secrets management
        # Packages provided by flake-parts modules
        config.treefmt.build.wrapper # Quick formatting tree-wide with `treefmt`

        # Packages from nixpkgs, for Nix, Flakes or local tools.
        pkgs.git # flakes require Git to be installed, since this repo is version controlled
        pkgs.caligula
        pkgs.git-cliff
        inputs'.nixos-anywhere.packages.nixos-anywhere
      ];
    };
  };
}
