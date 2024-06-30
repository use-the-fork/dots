{colors}:
with colors; ''
  #workspaces {
    padding-left: 0.5em;
    padding-right: 0.5em;
  }

  #workspaces label {
    font-size: 12px;
  }

  #workspaces button {
     padding: 0 0.5em;
     border-radius: 0px;
     margin: 0px;
     color: #${colors.base05};
     font-weight: bold;
     border-top: 2px solid transparent;
     border-bottom: 2px solid transparent;
  }

  #workspaces button.empty {
    color: #${colors.base02};
  }

  #workspaces button.visible {
    color: #${colors.base0D};
  }

  #workspaces button.active {
   color: #${colors.base0E};
   border-bottom: 2px solid #${colors.base0E};
  }

  #workspaces button.active label{
   color: #${colors.base0E};
  }

  #workspaces button.urgent {
    box-shadow: 2px 2px 2px 2px;
    border-radius: 1em;
    color: #${colors.base08};
  }
''
