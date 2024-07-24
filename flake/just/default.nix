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
}
