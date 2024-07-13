{self, ...}: {
  config = {
    boot.kernelParams = [
      "i8042.nomux" # Don't check presence of an active multiplexing controller
      "i8042.nopnp" # Don't use ACPIPn<P / PnPBIOS to discover KBD/AUX controllers
    ];

    system = {
      stateVersion = "24.11";
      configurationRevision = self.rev or "dirty";
    };
  };
}
