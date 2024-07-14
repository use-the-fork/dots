{pkgs, ...}: {
  # we want to handle user configurations on a per-file basis
  # users that are not in users/<username>.nix don't get to be a real user
  imports = [
    ./main-user.nix
    ./nix-builder.nix
    ./root.nix
  ];

  config = {
    users = {
      # Default user shell package
      defaultUserShell = pkgs.zsh;

      # And other stuff...
      allowNoPasswordLogin = false;
      enforceIdUniqueness = true;
    };
  };
}
