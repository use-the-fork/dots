{colors}:
with colors; ''
  #stats,
  #stats-drawer {
    padding-left: 5px;
    padding-right: 5px;
    color: #${colors.base09};
  }
  #battery,
  #cpu,
  #memory,
  #temperature,
  #disk,
  #network {
    padding: 0 0.5em;
  }

  /* Unique colors for modules */
  #cpu {
    color: #${colors.base08};
  }

  #memory {
    color: #${colors.base0A};
  }
  #temperature {
    color: #${colors.base0B};
  }

  #network {
    color: #${colors.base0D};
  }

  #network.disconnected {
    background-color: #f53c3c;
  }

  #temperature.critical {
    background-color: #eb4d4b;
  }
''
