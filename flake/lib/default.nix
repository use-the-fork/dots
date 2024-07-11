{
  inputs,
  lib,
  self,
  ...
}: let
  inherit (inputs.nixpkgs) lib;
  inherit (lib) foldl recursiveUpdate;
  inherit (import ./common.nix {inherit lib;}) import';

  # helpful utility functions used around the system
  builders = import' ./builders.nix {inherit inputs;}; # system builders
  services = import' ./services.nix; # systemd-service generators
  validators = import' ./validators.nix; # validate system conditions
  helpers = import' ./helpers {inherit lib self;}; # helper functions
  hardware = import' ./hardware.nix; # hardware capability checks
  secrets = import' ./secrets.nix; # agenix secret abstraction

  # aliases for commonly used strings or functions
  aliases = import' ./aliases.nix;

  xdgTemplate = {xdgTemplate = ./xdg.nix;}; # xdg user directories & templates

  importedLibs = [builders services secrets validators helpers hardware aliases xdgTemplate];
  extendedLib = lib.extend (_: _: foldl recursiveUpdate {} importedLibs);
in {
  perSystem = {
    # set the `lib` arg of the flake as the extended lib. If I am right, this should
    # override the previous argument (i.e. the original nixpkgs.lib) with my own
    # which is the nixpkgs library, but with my own custom actions.
    imports = [{_module.args.lib = extendedLib;}];
  };

  flake = {
    # also set `lib` as a flake output, which allows for it to be referenced outside
    # the scope of this flake. This is useful for when I want to refer to my extended
    # library from outside this flake.
    lib = extendedLib;
  };
}
