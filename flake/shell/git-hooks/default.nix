_: {
  perSystem = {pkgs, ...}: let
    inherit (import ./utils.nix {inherit pkgs;}) mkHook excludes;
  in {
    devenv.shells.default.pre-commit = {
      inherit excludes;
      #      check.enable = true;
      hooks = {
        alejandra = mkHook "alejandra" {enable = true;};
        actionlint = mkHook "actionlint" {enable = true;};
        treefmt = mkHook "treefmt" {enable = true;};
        exiftool = mkHook "exiftool" {
          enable = true;
          types = ["image"];
          entry = ''
            ${pkgs.exiftool}/bin/exiftool \
              -all= --icc_profile:all -tagsfromfile @ -orientation -overwrite_original
          '';
        };
        prettier = mkHook "prettier" {
          enable = true;
          settings = {
            binPath = "${pkgs.prettierd}/bin/prettierd";
            write = true;
          };
        };
      };
    };
  };
}
