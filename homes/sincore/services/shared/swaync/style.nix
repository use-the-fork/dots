{colors}:
with colors; ''
  * {
    all: unset;
    font-size: 14px;
    font-family: "Ubuntu Nerd Font";
    transition: 200ms;
  }

  trough highlight {
      background: #${colors.base05};
  }

  scale trough {
      margin: 0rem 1rem;
      background-color: #${colors.base02};
      min-height: 8px;
      min-width: 70px;
  }

  slider {
      background-color: #${colors.base0D};
  }

  .floating-notifications.background .notification-row .notification-background {
    box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px #${colors.base02};
    border-radius: 12.6px;
    margin: 18px;
    background-color: #${colors.base00};
    color: #${colors.base05};
    padding: 0;
  }

  .floating-notifications.background .notification-row .notification-background .notification {
    padding: 7px;
    border-radius: 12.6px;
  }

  .floating-notifications.background .notification-row .notification-background .notification.critical {
    box-shadow: inset 0 0 7px 0 #${colors.base08};
  }

  .floating-notifications.background .notification-row .notification-background .notification .notification-content {
    margin: 7px;
  }

  .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
    color: #${colors.base05};
  }

  .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
    color: #${colors.base05};
  }

  .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
    color: #${colors.base05};
  }

  .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* {
    min-height: 3.4em;
  }

  .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action {
    border-radius: 7px;
    color: #${colors.base05};
    background-color: #${colors.base02};
    box-shadow: inset 0 0 0 1px #${colors.base03};
    margin: 7px;
  }

  .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #${colors.base02};
    color: #${colors.base05};
  }

  .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #74c7ec;
    color: #${colors.base05};
  }

  .floating-notifications.background .notification-row .notification-background .close-button {
    margin: 7px;
    padding: 2px;
    border-radius: 6.3px;
    color: #${colors.base00};
    background-color: #${colors.base08};
  }

  .floating-notifications.background .notification-row .notification-background .close-button:hover {
    background-color: #${colors.base08};
    color: #${colors.base00};
  }

  .floating-notifications.background .notification-row .notification-background .close-button:active {
    background-color: #${colors.base08};
    color: #${colors.base00};
  }

  .control-center {
    box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px #${colors.base02};
    border-radius: 12.6px;
    margin: 18px;
    background-color: #${colors.base00};
    color: #${colors.base05};
    padding: 14px;
  }

  .control-center .widget-title>label {
    color: #${colors.base05};
    font-size: 1em;
  }

  .control-center .widget-title button {
    border-radius: 7px;
    color: #${colors.base05};
    background-color: #${colors.base02};
    box-shadow: inset 0 0 0 1px #${colors.base03};
    padding: 8px;
  }

  .control-center .widget-title button:hover {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #${colors.base04};
    color: #${colors.base05};
  }

  .control-center .widget-title button:active {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #74c7ec;
    color: #${colors.base00};
  }

  .control-center .notification-row .notification-background {
    border-radius: 7px;
    color: #${colors.base05};
    background-color: #${colors.base02};
    box-shadow: inset 0 0 0 1px #${colors.base03};
    margin-top: 14px;
  }

  .control-center .notification-row .notification-background .notification {
    padding: 7px;
    border-radius: 7px;
  }

  .control-center .notification-row .notification-background .notification.critical {
    box-shadow: inset 0 0 7px 0 #${colors.base08};
  }

  .control-center .notification-row .notification-background .notification .notification-content {
    margin: 7px;
  }

  .control-center .notification-row .notification-background .notification .notification-content .summary {
    color: #${colors.base05};
  }

  .control-center .notification-row .notification-background .notification .notification-content .time {
    color: #${colors.base05};
  }

  .control-center .notification-row .notification-background .notification .notification-content .body {
    color: #${colors.base05};
  }

  .control-center .notification-row .notification-background .notification>*:last-child>* {
    min-height: 3.4em;
  }

  .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action {
    border-radius: 7px;
    color: #${colors.base05};
    background-color: #11111b;
    box-shadow: inset 0 0 0 1px #${colors.base03};
    margin: 7px;
  }

  .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #${colors.base02};
    color: #${colors.base05};
  }

  .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #74c7ec;
    color: #${colors.base05};
  }

  .control-center .notification-row .notification-background .close-button {
    margin: 7px;
    padding: 2px;
    border-radius: 6.3px;
    color: #${colors.base00};
    background-color: #${colors.base08};
  }

  .close-button {
    border-radius: 6.3px;
  }

  .control-center .notification-row .notification-background .close-button:hover {
    background-color: #${colors.base08};
    color: #${colors.base00};
  }

  .control-center .notification-row .notification-background .close-button:active {
    background-color: #${colors.base08};
    color: #${colors.base00};
  }

  .control-center .notification-row .notification-background:hover {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #7f849c;
    color: #${colors.base05};
  }

  .control-center .notification-row .notification-background:active {
    box-shadow: inset 0 0 0 1px #${colors.base03};
    background-color: #74c7ec;
    color: #${colors.base05};
  }

  .notification.critical progress {
    background-color: #${colors.base08};
  }

  .notification.low progress,
  .notification.normal progress {
    background-color: #${colors.base0D};
  }

  .control-center-dnd {
    margin-top: 5px;
    border-radius: 8px;
    background: #${colors.base02};
    border: 1px solid #${colors.base03};
    box-shadow: none;
  }

  .control-center-dnd:checked {
    background: #${colors.base02};
  }

  .control-center-dnd slider {
    background: #${colors.base03};
    border-radius: 8px;
  }

  .widget-dnd {
    margin: 0px;
    font-size: 1.1rem;
  }

  .widget-dnd>switch {
    font-size: initial;
    border-radius: 8px;
    background: #${colors.base02};
    border: 1px solid #${colors.base03};
    box-shadow: none;
  }

  .widget-dnd>switch:checked {
    background: #${colors.base02};
  }

  .widget-dnd>switch slider {
    background: #${colors.base03};
    border-radius: 8px;
    border: 1px solid #6c7086;
  }

  .widget-mpris .widget-mpris-player {
      background: #${colors.base02};
      padding: 7px;
  }

  .widget-mpris .widget-mpris-title {
      font-size: 1rem;
  }

  .widget-mpris .widget-mpris-subtitle {
      font-size: 0.8rem;
  }

  .widget-menubar>box>.menu-button-bar>button>label {
      font-size: 1rem;
      padding: 0.5rem 1rem;
  }

  .widget-menubar>box>.menu-button-bar>:last-child {
      color: #${colors.base08};
  }

  .power-buttons button:hover,
  .powermode-buttons button:hover,
  .screenshot-buttons button:hover {
      background: #${colors.base02};
  }

  .control-center .widget-label>label {
    color: #${colors.base05};
    font-size: 1rem;
  }
  .widget-buttons-grid>flowbox>flowboxchild>button label {
      font-size: 1rem;
  }

  .widget-buttons-grid>flowbox>flowboxchild>button:hover label {
      color: #${colors.base0B};
  }

  .widget-volume {
      padding-top: 1rem;
  }

  .widget-volume label {
      font-size: 1rem;
      color: #${colors.base0D};
  }

  .widget-volume trough highlight {
      background: #${colors.base0D};
  }

  .widget-backlight trough highlight {
      background: #${colors.base0A};
  }

  .widget-backlight label {
      font-size: 1rem;
      color: #${colors.base0A};
  }

  .widget-backlight .KB {
      padding-bottom: 1rem;
  }

  .image {
    padding-right: 0.5rem;
  }
''
