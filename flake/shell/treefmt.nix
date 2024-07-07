_: {
  perSystem = _: {
    devenv.shells.default = {
      packages = [
      ];

      #enable tree fmt
      treefmt = {
        projectRootFile = "flake.nix";
        programs = {
          alejandra.enable = true;
          deadnix.enable = true;
          statix = {
            enable = true;
            disabled-lints = [
              "manual_inherit_from"
            ];
          };

          mdformat.enable = true;
          taplo.enable = true;
          shfmt.enable = true;
          prettier.enable = true;
        };
      };
    };

    # Add your auto-formatters here.
    # cf. https://numtide.github.io/treefmt/
    #    treefmt.config = {
    #      projectRootFile = "flake.nix";
    #      flakeCheck = false; # pre-commit-hooks.nix checks this
    #      programs = {
    #        alejandra.enable = true;
    #        deadnix.enable = true;
    #        statix = {
    #          enable = true;
    #          disabled-lints = [
    #            "manual_inherit_from"
    #          ];
    #        };
    #        mdformat.enable = true;
    #        taplo.enable = true;
    #        shfmt.enable = true;
    #        prettier.enable = true;
    #      };
    #    };

    #    devShells.default = pkgs.mkShell {
    #      inputsFrom = [
    #        config.treefmt.build.devShell
    #        config.just-flake.outputs.devShell
    #        config.pre-commit.devShell
    #      ];
    #      packages = [
    #        pkgs.caligula
    #        pkgs.git-cliff
    #        inputs.nixos-anywhere.packages.${system}.nixos-anywhere
    #      ];
    #    };
  };
}
