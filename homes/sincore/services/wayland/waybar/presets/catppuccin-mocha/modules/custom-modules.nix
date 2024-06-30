{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe getExe';
  githubHelper =
    pkgs.writeShellScriptBin "githubHelper"
    /*
    bash
    */
    ''
      #!/usr/bin/env bash

      NOTIFICATIONS="$(${getExe pkgs.gh} api notifications)"
      COUNT="$(echo "$NOTIFICATIONS" | ${getExe pkgs.jq} 'length')"

      echo '{"text":'"$COUNT"',"tooltip":"'"$COUNT"' Notifications","class":""}'
    '';
in {
  "custom/ellipses" = {
    "format" = "";
    "tooltip" = false;
  };

  "custom/github" = {
    format = "  {}";
    return-type = "json";
    interval = 60;
    exec = "${getExe githubHelper}";
    on-click = "${getExe' pkgs.coreutils "sleep"} 0.1 && ${getExe' pkgs.xdg-utils "xdg-open"} https://github.com/notifications";
  };

  "custom/lock" = {
    format = "󰍁 ";
    tooltip = false;
    on-click = "${getExe pkgs.swaylock-effects} -fF";
  };

  "custom/notification" = {
    "tooltip" = true;
    "format" = "{icon}  {}";
    "format-icons" = {
      "notification" = "<span foreground='red'><sup></sup></span>";
      "none" = "";
      "dnd-notification" = "<span foreground='red'><sup></sup></span>";
      "dnd-none" = "";
      "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
      "inhibited-none" = "";
      "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
      "dnd-inhibited-none" = "";
    };
    "return-type" = "json";
    "exec-if" = "which ${getExe' pkgs.swaynotificationcenter "swaync-client"}";
    "exec" = "${getExe' pkgs.swaynotificationcenter "swaync-client"} -swb";
    "on-click" = "${getExe' pkgs.coreutils "sleep"} 0.1 && ${getExe' pkgs.swaynotificationcenter "swaync-client"} -t -sw";
    "on-click-right" = "${getExe' pkgs.coreutils "sleep"} 0.1 && ${getExe' pkgs.swaynotificationcenter "swaync-client"} -d -sw";
    "escape" = true;
  };

  "custom/separator-right" = {
    "format" = "";
    "tooltip" = false;
  };

  "custom/separator-stats" = {
    "format" = "";
    "tooltip" = false;
  };

  "custom/separator-left" = {
    "format" = "";
    "tooltip" = false;
  };
}
