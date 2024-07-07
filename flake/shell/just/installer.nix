{
  perSystem = {
    lib,
    pkgs,
    ...
  }: {
    devenv.shells.default.just.recipes.installer = {
      enable = true;
      justfile = ''
        # builds and flashes USB installer.
        installer:
          set -euo pipefail
          rm -rf ./result
          nix build .#images.installer
          ${lib.getExe pkgs.caligula} burn ./result/iso/nixos.iso
      '';
    };
  };
}
