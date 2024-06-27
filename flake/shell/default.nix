{inputs, ...}: {
  imports = [
    inputs.treefmt-nix.flakeModule
    inputs.pre-commit-hooks-nix.flakeModule
    inputs.just-flake.flakeModule

    ./just/bump.nix
    ./just/switch.nix
    ./just/installer.nix
    ./just/git-cliff.nix
    ./just/flash.nix
    ./just/boot.nix
    ./just/iso.nix
    ./just/build.nix
    ./just/test.nix
    ./just/tree-fmt.nix #tree fmt command
  ];

  perSystem = {
    pkgs,
    config,
    system,
    ...
  }: {
    # Add your auto-formatters here.
    # cf. https://numtide.github.io/treefmt/
    treefmt.config = {
      projectRootFile = "flake.nix";
      flakeCheck = false; # pre-commit-hooks.nix checks this
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

    devShells.default = pkgs.mkShell {
      inputsFrom = [
        config.treefmt.build.devShell
        config.just-flake.outputs.devShell
        config.pre-commit.devShell
      ];
      packages = [
        pkgs.caligula
        pkgs.git-cliff
        inputs.nixos-anywhere.packages.${system}.nixos-anywhere
      ];
    };
  };
}
