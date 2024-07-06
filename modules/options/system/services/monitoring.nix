{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkService;
  meta = config.modules.meta;
  #  sys = config.modules.system;
  #  cfg = sys.services;
  # mkEnableOption is the same as mkEnableOption but with the default value being equal to cfg.monitoring.enable
  #    mkEnableOption' = desc: mkEnableOption "${desc}" // {default = cfg.monitoring.enable;};
in {
  options.modules.system.services = {
    # monitoring tools
    monitoring = {
      enable = mkEnableOption "system monitoring stack";

      prometheus = mkService {
        name = "Prometheus";
        type = "monitoring";
        port = 9100;
        subDomain = "prometheus.${meta.subDomainName}";
      };

      prometheus.enable = mkEnableOption "Prometheus monitoring service";
      grafana.enable = mkEnableOption "Grafana monitoring service";
    };
  };
}
