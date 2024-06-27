{
  lib,
  osConfig,
  ...
}: let
  inherit (lib) mkIf concatStringsSep;
  inherit (lib.lists) optionals;
  inherit (osConfig) modules;
  sys = modules.system;
  prg = sys.programs;
in {
  config = mkIf prg.chromium.enable {
    programs.chromium = {
      enable = true;
      extensions = [
        {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # sponsor block
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock
        {id = "hdokiejnpimakedhajhdlcegeplioahd";} # lastpass
        {id = "iaiomicjabeggjcfkbimgmglanimpnae";} # tab manager
        {id = "bkkmolkhemgaeaeggcmfbghljjjoofoh";} # Catppuccin Theme Mocha
      ];
      commandLineArgs =
        [
          # Experimental features
          "--enable-features=${
            concatStringsSep "," [
              "BackForwardCache:enable_same_site/true"
              "CopyLinkToText"
              "OverlayScrollbar"
              "TabHoverCardImages"
              "VaapiVideoDecoder"
            ]
          }"

          # Performance
          "--enable-gpu-rasterization"
          "--enable-oop-rasterization"
          "--enable-zero-copy"
          "--ignore-gpu-blocklist"
        ]
        ++ optionals (lib.isWayland osConfig) [
          # Wayland

          # Disabled because hardware acceleration doesn't work
          # when disabling --use-gl=egl, it's not gonna show any emoji
          # and it's gonna be slow as hell
          # "--use-gl=egl"

          "--ozone-platform=wayland"
          "--enable-features=UseOzonePlatform"
        ];
    };
  };
}
