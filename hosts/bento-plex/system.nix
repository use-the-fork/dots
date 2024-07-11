{self, ...}: {
  config = {
    boot.isContainer = true;

    system = {
      stateVersion = "23.11";
      configurationRevision = self.rev or "dirty";
    };
  };
}
