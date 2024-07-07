{
  imports = [
    # essentials
    ./databases # mysql
    ./nginx # base nginx webserver configuration
    ./caddy # base caddy webserver configuration

    ./unbound
    ./blocky
    ./monitoring
  ];
}
