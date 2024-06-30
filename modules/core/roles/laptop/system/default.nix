{
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./power
    ./touchpad.nix
  ];

  config = {
    powerManagement.enable = true;

    services = {
      logind = {
        lidSwitch = "suspend-then-hibernate";
        lidSwitchExternalPower = "suspend-then-hibernate";
        extraConfig = ''
          HandlePowerKey=suspend-then-hibernate
          HibernateDelaySec=3600
        '';
      };
    };
  };
}
