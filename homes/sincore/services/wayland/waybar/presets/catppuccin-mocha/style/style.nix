{colors}:
with colors; ''
   /**
   * Global configuration for theme
   * */
   * {
     font-family: Ubuntu Nerd Font;
     font-size: 12px;
     color: #${colors.base05};
   }

    window#waybar {
        background: none;
        border-radius: 0px;
    }

    window#waybar.empty #window {
      background-color: transparent;
    }

  .modules-left {
      background: #${colors.base02};
      border-top-right-radius: 14px;
      border-bottom-right-radius: 14px;
      padding: 0px 12px 0px 4px;
    }

    .modules-right {
      background: #${colors.base02};
      border-top-left-radius: 14px;
      border-bottom-left-radius: 14px;
      padding: 0px 4px 0px 12px;
    }

    .modules-center {
      background: transparent;
    }

   tooltip {
     background: #${colors.base00};
     border: 1px solid #${colors.base0D};
   }

   tooltip label {
     color: white;
   }

   label:focus {
     background-color: #000000;
   }

   button {
     /* Use box-shadow instead of border so the text isn't offset */
     box-shadow: inset 0 -3px transparent;
     /* Avoid rounded borders under each button name */
     border: none;
     border-radius: 0;
   }

   /* Remove border from parent waybar */
   box {
     border: none;
   }

   /* Add spacing for right side modules */
   #user,
   #custom-weather,
   #keyboard-state,
   #mpd {
     padding: 0 1em;
   }

   /* tray needs less padding */
   #tray {
     padding: 0em;
   }

   #clock {
     font-size: 12px;
   }

   #custom-separator-right,
   #custom-separator-left,
   #custom-separator-stats {
     font-size: 13px;
     padding-left: 0.5em;
     padding-right: 0.5em;
     color: #${colors.base05};
   }

   @keyframes blink {
     to {
       background-color: #ffffff;
       color: #000000;
     }
   }
''
