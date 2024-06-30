{colors}: let
  control-center = import ./style/control-center.nix {inherit colors;};
  power = import ./style/power.nix {inherit colors;};
  stats = import ./style/stats.nix {inherit colors;};
  style = import ./style/style.nix {inherit colors;};
  workspaces = import ./style/workspaces.nix {inherit colors;};
in ''
  ${control-center}
  ${power}
  ${stats}
  ${style}
  ${workspaces}
''
