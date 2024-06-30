{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe getExe';
in {
  backlight = let
    brightnessctl = lib.getExe pkgs.brightnessctl;
  in {
    format = "{icon}  {percent}%";
    format-icons = [
      "󰋙"
      "󰫃"
      "󰫄"
      "󰫅"
      "󰫆"
      "󰫇"
      "󰫈"
    ];
    on-scroll-up = "${brightnessctl} s +1%";
    on-scroll-down = "${brightnessctl} s 1%-";
  };

  upower = {
    icon-size = 12;
    hide-if-empty = true;
    tooltip = true;
    tooltip-spacing = 5;
  };

  clock = {
    tooltip-format = "<big>{:%a %d %b}</big>\n<tt><small>{calendar}</small></tt>";
    format = "{:%I:%M %p }";
  };

  disk = {
    format = "  {percentage_used}%";
  };

  cpu = {
    format = "  {usage}%";
    tooltip = true;
    states = {
      "50" = 50;
      "60" = 75;
      "70" = 90;
    };
  };

  idle_inhibitor = {
    format = "{icon} ";
    format-icons = {
      activated = "";
      deactivated = "";
    };
  };

  keyboard-state = {
    numlock = true;
    capslock = true;
    format = "{icon} {name}";
    format-icons = {
      locked = "";
      unlocked = "";
    };
  };

  memory = {
    format = "󰍛  {}%";
  };

  "mpris" = {
    "format" = "{player_icon} {status_icon} {dynamic}";
    "format-paused" = "{player_icon} {status_icon} <i>{dynamic}</i>";
    "max-length" = 45;
    "player-icons" = {
      "chromium" = "";
      "default" = "";
      "firefox" = "";
      "mopidy" = "";
      "mpv" = "";
      "spotify" = "";
    };
    "status-icons" = {
      "paused" = "";
      "playing" = "";
      "stopped" = "";
    };
  };

  network = let
    nm-editor = "${getExe' pkgs.networkmanagerapplet "nm-connection-editor"}";
  in {
    interval = 1;
    format-wifi = "󰜷 {bandwidthUpBytes} 󰜮 {bandwidthDownBytes}";
    format-ethernet = "󰜷 {bandwidthUpBytes} 󰜮 {bandwidthDownBytes}";
    tooltip-format = "󰈀 {ifname} via {gwaddr}";
    format-linked = "󰈁 {ifname} (No IP)";
    format-disconnected = " Disconnected";
    format-alt = "{ifname}: {ipaddr}/{cidr}";
    on-click-right = "${nm-editor}";
  };

  systemd-failed-units = {
    hide-on-ok = false;
    format = "✗ {nr_failed}";
    format-ok = "✓";
    system = true;
    user = false;
  };

  temperature = {
    hwmon-path-abs = "/sys/class/hwmon/hwmon2";
    input-filename = "temp1_input";
    critical-threshold = 80;
    format-critical = "{temperatureC}°C {icon}";
    format = "{icon} {temperatureC}°C";
    format-icons = [
      ""
      ""
      ""
    ];
    interval = "5";
  };

  tray = {
    spacing = 10;
  };

  user = {
    format = "{user}";
    interval = 60;
    height = 30;
    width = 30;
    icon = true;
  };

  pulseaudio = {
    format = "{icon}  {volume}%";
    format-bluetooth = "{icon}  {volume}%";
    format-muted = "";
    format-icons = {
      headphone = "";
      hands-free = "";
      headset = "";
      phone = "";
      portable = "";
      car = "";
      default = [
        ""
        ""
      ];
    };
    scroll-step = 1;
    on-click = "pavucontrol";
    ignored-sinks = ["Easy Effects Sink"];
  };
}
