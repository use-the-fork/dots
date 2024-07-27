{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs) plymouth;
  inherit (lib) mkIf;

  cfg = config.modules.system.boot.plymouth;
in {
  config = mkIf cfg.enable {
    # configure plymouth theme
    # <https://github.com/adi1090x/plymouth-themes>
    #    boot.plymouth = let
    #      pack = cfg.pack;
    #      theme = cfg.theme;
    #    in
    #      {
    #        enable = true;
    #      }
    #      // lib.optionalAttrs cfg.withThemes {
    #        themePackages = [(self'.packages.plymouth-themes.override {inherit pack theme;})];
    #
    #        inherit theme;
    #      };

    #FIXME: Not sure why theme not working.
    boot.plymouth = {
      enable = true;
      #        font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
      themePackages = [pkgs.nixos-bgrt-plymouth];
      theme = "nixos-bgrt";
    };

    # make plymouth work with sleep
    powerManagement = {
      powerDownCommands = ''
        ${plymouth} --show-splash
      '';
      resumeCommands = ''
        ${plymouth} --quit
      '';
    };
  };
}
