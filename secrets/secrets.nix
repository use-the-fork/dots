let
  keys = import ../keys;
  inherit (keys) servers workstations;
  inherit (keys) mkGlobal;
in {
  # core system secrets
  "client/tailscale.age".publicKeys = mkGlobal (workstations ++ servers);
  "client/cloudflare.age".publicKeys = mkGlobal (workstations ++ servers);
  "service/caddy-cloudflare.age".publicKeys = mkGlobal (workstations ++ servers);
}
