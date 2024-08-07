{
  lib,
  pkgs,
  ...
}: let
  loadDashboard = file: let
    dashboard = lib.importJSON file;
  in rec {
    name = "provision-dashboard-${dashboard.uid}.json";
    path = builtins.toFile name (builtins.toJSON dashboard);
  };

  dashboardsDir =
    pkgs.linkFarm
    "grafana-provisioning-dashboards"
    (map loadDashboard (lib.filesystem.listFilesRecursive ./objects/dashboards));
in {
  services.grafana.provision.dashboards.settings = {
    providers = lib.singleton {
      options.path = dashboardsDir;
      allowUiUpdates = true;
    };
  };
}
