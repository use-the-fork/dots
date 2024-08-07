{lib}: let
  inherit (lib) mkEnableOption mkOption;
  inherit (lib.types) str int;

  # The `mkService` function takes a few arguments to generate
  # a module for a service without repeating the same options
  # over and over: every online service needs a host and a port.
  # I can't exactly tell you why, but if I am to be honest
  # this is actually a horrendous abstraction
  mkService = {
    name,
    type ? "", # type being an empty string means it can be skipped, omitted
    host ? "127.0.0.1", # default to listening only on localhost
    port ? 0, # default port should be a stub
    subDomain ? "", # domain being an empty string means it can be skipped, omitted. This is also used to create our vHosts Etc
    extraOptions ? {}, # used to define additional modules
  }: {
    enable = mkEnableOption "${name} ${type} service";
    settings =
      {
        subDomain = mkOption {
          type = str;
          default = subDomain;
          description = "The sub-domain ${subDomain} will be";
        };

        host = mkOption {
          type = str;
          default = host;
          description = "The host ${name} will listen on";
        };

        port = mkOption {
          type = int;
          default = port;
          description = "The port ${name} will listen on";
        };
      }
      // extraOptions;
  };
in {
  inherit mkService;
}
