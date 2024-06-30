_: {
  home.sessionVariables = {
    #    NIX_AUTO_RUN = osConfig.sops.secrets.my-password.path;
  };
  #  xdg = {
  #    enable = true;
  #    cacheHome = "${config.home.homeDirectory}/.cache";
  #    configHome = "${config.home.homeDirectory}/.config";
  #    dataHome = "${config.home.homeDirectory}/.local/share";
  #    stateHome = "${config.home.homeDirectory}/.local/state";
  #
  #    configFile = {
  #      "npm/npmrc" = template.npmrc;
  #      "python/pythonrc" = template.pythonrc;
  #    };
  #
  #    userDirs = {
  #      enable = pkgs.stdenv.isLinux;
  #      createDirectories = true;
  #
  #      download = "${config.home.homeDirectory}/Downloads";
  #      desktop = "${config.home.homeDirectory}/Desktop";
  #      documents = "${config.home.homeDirectory}/Documents";
  #
  #      publicShare = "${config.home.homeDirectory}/.local/share/public";
  #      templates = "${config.home.homeDirectory}/.local/share/templates";
  #
  #      music = "${config.home.homeDirectory}/Media/Music";
  #      pictures = "${config.home.homeDirectory}/Media/Pictures";
  #      videos = "${config.home.homeDirectory}/Media/Videos";
  #
  #      extraConfig = {
  #        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
  #        XDG_MAIL_DIR = "${config.home.homeDirectory}/Mail";
  #      };
  #    };
  #
  #    mimeApps = {
  #      enable = true;
  #      associations.added = associations;
  #      defaultApplications = associations;
  #    };
  #  };
}
