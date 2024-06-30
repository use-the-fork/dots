{colors}:
with colors; ''
  #control-center {
    padding-left: 5px;
    padding-right: 5px;
    color: #${colors.base05};
  }

  #custom-notification,
  #custom-github,
  #idle_inhibitor,
  #wireplumber,
  #pulseaudio,
  #audio,
  #bluetooth,
  #gamemode,
  #systemd-failed-units,
  #upower,
  #backlight
  {
    padding: 0 0.5em;
  }

  #custom-updates.updated {
    padding-left: 0;
    padding-right: 1em;
  }

  /* Unique colors for modules */
  #idle_inhibitor {
    color: #${colors.base07};
  }

  #pulseaudio {
    color: #${colors.base0B};
  }

  #custom-github {
    color: #${colors.base0D};
  }

  #upower {
    color: #${colors.base09};
  }

  #upower.charging {
    color: #${colors.base0B};
  }

  #backlight {
    color: #${colors.base0A};
  }

  #custom-notification {
    color: #${colors.base05};
  }

  #systemd-failed-units {
    color: #${colors.base0E};
  }

  #custom-pipewire.muted,
  #pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
  }

''
