{config, ...}: {
  imports = [
    ./bash.nix
    ./direnv.nix
    ./git.nix
    ./nano.nix
    ./zsh.nix
  ];
  config = {
    programs = {
      # less pager
      less.enable = true;

      # run commands without installing the programs
      comma.enable = true;
    };
  };
}
