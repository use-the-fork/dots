{
  modules.usrEnv = {
    desktop = "Hyprland";
    notification = "swaynotificationcenter";
    wayland = {
      statusBar = {
        waybar.enable = true;
      };
    };
    programs.screenlock.swaylock.enable = true;
  };
}
