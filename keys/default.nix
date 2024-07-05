let
  inherit (builtins) attrValues;
  utils = {
    # helpers
    mkGlobal = list: list ++ [users.main];
  };

  users = {
    # users
    main = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOSE69dmDxQ/UJ8k+8CL3lzc/PyJXXO/2aCcYQOjkTW+ sincore@sushi";
  };

  machines = {
    # hosts
    suhsi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIITeldysWRlM603quJfPY/d6Vy23Bkp+w81zwJGO8F4w root@sushi";
    ramen = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL4HTn7sF6h2gAHBLI/ywPkDnXNUV9D6CiaqnAwb9cbN root@ramen";
  };

  # aliases - Update the below to group your workstations or servers so that these public keys are used across all of them.
  servers = attrValues {inherit (machines) ramen;};
  workstations = attrValues {inherit (machines) suhsi;};
in {
  inherit (utils) mkGlobal;
  inherit (users) main;
  #      inherit (machines) helios enyo hermes icarus leto;
  inherit workstations;
  inherit servers;
}
