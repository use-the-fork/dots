{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) attrValues mkDefault;
in {
  console = let
    variant = "v18n";
  in {
    enable = mkDefault true;
    earlySetup = true;
    keyMap = "trq";

    font = "ter-powerline-${variant}";
    packages = attrValues {inherit (pkgs) terminus_font powerline-fonts;};
  };
}
