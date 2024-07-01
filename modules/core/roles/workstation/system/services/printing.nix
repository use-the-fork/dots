{
  config,
  pkgs,
  ...
}: {
  config = {
    # enable cups and add some drivers for common printers
    services = {
      printing = {
        enable = true;

        #enable interface for print mangment.
        webInterface = true;
        drivers = with pkgs; [
          gutenprint
          gutenprintBin
          hplip
          epson-escpr
          epson-escpr2
        ];

        browsing = true;
      };

      # required for network discovery of printers
      avahi = {
        enable = true;
        # resolve .local domains for printers
        nssmdns4 = true;
        # pass avahi port(s) to the firewall
        openFirewall = true;
      };
    };
  };
}
