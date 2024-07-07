{...}: {
  imports = [
    ./bump.nix
    ./switch.nix
    ./installer.nix
    ./git-cliff.nix
    ./flash.nix
    ./boot.nix
    ./iso.nix
    ./build.nix
    ./switch-remote.nix
    ./test.nix
    ./tree-fmt.nix #tree fmt command
  ];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    devenv.shells.default = {
      packages = [
        pkgs.caligula
        pkgs.git-cliff
        inputs'.nixos-anywhere.packages.nixos-anywhere
      ];
      just = {
        enable = true;
        recipes = {
          up.enable = false;
          version.enable = false;
        };
      };
    };
  };
}
