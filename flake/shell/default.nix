{inputs, ...}: {
  imports = [
    inputs.devenv.flakeModule

    ./treefmt.nix
    ./git-hooks
    ./just
  ];

  perSystem = _: {
    devenv.shells.default = {
      devenv.root = "file+file:///home/sincore/.config/dots";
    };
  };
}
