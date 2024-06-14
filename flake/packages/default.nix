{
  inputs,
  src,
  ...
}: {
  perSystem = {
    lib,
    pkgs,
    ...
  }: rec {
    packages = let
      scope = lib.makeScope pkgs.newScope (_self: {inherit inputs;});
    in
      lib.filesystem.packagesFromDirectoryRecursive {
        inherit (scope) callPackage;
        directory = "${src}/packages";
      };
  };
}
