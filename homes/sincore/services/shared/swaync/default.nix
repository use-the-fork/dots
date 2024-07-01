{
  osConfig,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf isWayland getExe' mkGraphicalService;
  inherit (osConfig) modules;
  inherit (modules.style.colorScheme) colors;
  sys = modules.system;
  prg = sys.programs;

  env = modules.usrEnv;
  dev = modules.device;
  acceptedTypes = ["desktop" "laptop" "lite" "hybrid"];

  swaync_style = import ./style.nix {inherit colors;};
  swaync_config = import ./config.nix {inherit colors lib pkgs;};
in {
  config = mkIf (builtins.elem dev.type acceptedTypes && prg.gui.enable && (isWayland osConfig) && env.notification == "swaynotificationcenter") {
    home.packages = with pkgs; [
      swaynotificationcenter
      coreutils
    ];

    systemd.user.services = {
      swaynotificationcenter = mkGraphicalService {
        Unit.Description = "Sway Notification Center";
        Service = {
          ExecStart = "${getExe' pkgs.swaynotificationcenter "swaync"}";
          Restart = "always";
        };
      };
    };

    home.file = {
      ".config/swaync/style.css".text = swaync_style;
      ".config/swaync/config.json".text = swaync_config;
    };
  };
}
