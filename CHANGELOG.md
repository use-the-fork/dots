# Changelog

All notable changes to this project will be documented in this file.

## \[2024-07-01\]

### <!-- 0 -->⛰️ Features

- _(just)_ Add bump command to justfile - ([51aa305](https://github.com/use-the-fork/dots/commit/51aa3056f6a05e271e3370799901b454159c453a)) - use-the-fork
- _(laptop-system)_ Add power management configurations and service files - ([c6bbac6](https://github.com/use-the-fork/dots/commit/c6bbac671a90bf9257d1c62e607746ffcd923364)) - use-the-fork
- _(nix)_ Enable automatic garbage collection and remove limit on http connections - ([37c34ff](https://github.com/use-the-fork/dots/commit/37c34ff4ce2db07c49810d293b7ee97b909d0e9e)) - use-the-fork
- _(printing service)_ Enable web interface and browsing, add additional drivers - ([f1a4e2c](https://github.com/use-the-fork/dots/commit/f1a4e2c838c4e65b13dd2d5daae04291614c721d)) - use-the-fork
- _(secrets)_ Add new encrypted secrets file for OpenAI development environment - ([8616490](https://github.com/use-the-fork/dots/commit/861649063022d4ec933b3da48e18d3815ab97c56)) - use-the-fork
- _(services)_ Enable mako service based on device type and notification environment - ([b8d9a8b](https://github.com/use-the-fork/dots/commit/b8d9a8beefe26f8b8a2b5ea811568656194b0e6c)) - use-the-fork
- _(services)_ Add swaync to default services list - ([6ee9f00](https://github.com/use-the-fork/dots/commit/6ee9f008c9cb4d1e2b424693cae2425a0b2f4f27)) - use-the-fork
- _(swaync)_ Update notification config, add notification daemon to desktop env, move swaync to shared services - ([c2aaf8e](https://github.com/use-the-fork/dots/commit/c2aaf8e9ff95270d63a48d6b75b117ceeaf20bc4)) - use-the-fork
- _(system)_ Enable autoLogin and add chromium and realvnc-vnc-viewer modules - ([8515600](https://github.com/use-the-fork/dots/commit/851560056ee4c3dfdcd36a8f0b662da45daf361a)) - use-the-fork
- _(system.nix)_ Disable Chromium in system modules - ([e5de9eb](https://github.com/use-the-fork/dots/commit/e5de9eb7f9344f7a8e1868d16323d9958b55fa60)) - use-the-fork
- _(system/programs)_ Add Realvnc VNC Viewer to the list of enabled programs - ([3543fdc](https://github.com/use-the-fork/dots/commit/3543fdc48135d2ce7113af205fed0ff586348f80)) - use-the-fork
- _(terminal/tools)_ Add xdg configuration file - ([d4671c0](https://github.com/use-the-fork/dots/commit/d4671c059fd6147291f0d48694944b3bdd54e6f6)) - use-the-fork
- _(user environment)_ Add swaynotificationcenter to modules in usrEnv.nix - ([d1ce45f](https://github.com/use-the-fork/dots/commit/d1ce45f2f965a79a0bb4bd9542c6c8522c9f3afb)) - use-the-fork
- _(No Category)_ Add git-cliff to list of packages in default.nix

### <!-- 1 -->🐛 Bug Fixes

- _(flake.nix)_ Update hyprland git URL - ([733de7d](https://github.com/use-the-fork/dots/commit/733de7daa3a1c26d34cc3a83d5bbbd0f83d9f57a)) - use-the-fork
- _(gui)_ Correct package reference in 3dprint.nix - ([5b8b9f8](https://github.com/use-the-fork/dots/commit/5b8b9f8e0e41c61c98d9514f7480f9ba3d554bcd)) - use-the-fork

### <!-- 4 -->🚜 Refactor

- _(chromium)_ Simplify setup and change extensions - ([7f7fdef](https://github.com/use-the-fork/dots/commit/7f7fdefe4f240e67fd4b3fc879fd2e2e71760603)) - use-the-fork
- _(code)_ Remove `nix flake update robo-nix-lib` in multiple files and rename `changelog` to `cliff` in `git-cliff.nix` - ([be67ee1](https://github.com/use-the-fork/dots/commit/be67ee1e612a15f6b13be59aacb36e7aa89b32b8)) - use-the-fork
- _(core)_ Remove unused environment variables from Wayland config - ([444fcbd](https://github.com/use-the-fork/dots/commit/444fcbdf26c61c79e87f50a3fa95448af7653dae)) - use-the-fork
- _(core)_ Simplify QML package inheritance in theme module - ([484a28b](https://github.com/use-the-fork/dots/commit/484a28bf41103a74df52c848372332c6abafe140)) - use-the-fork
- _(dunst)_ Add environment notification check and alter origin position - ([4e92a60](https://github.com/use-the-fork/dots/commit/4e92a60b06083f68f8e760eccf4ee0d6a2550fe7)) - use-the-fork
- _(gpu)_ Change hardware settings from opengl to graphics for amd support - ([3a17a4c](https://github.com/use-the-fork/dots/commit/3a17a4c5436de31a87ff7113e3d32dd92e1ebc56)) - use-the-fork
- _(services)_ Update getExe function to getExe' in swaync service configuration - ([a293351](https://github.com/use-the-fork/dots/commit/a29335142d9f13448c7b4603e4d036fd5ea4faa5)) - use-the-fork
- _(signal-desktop.nix)_ Replace mkHyprlandService with mkGraphicalService - ([45ff816](https://github.com/use-the-fork/dots/commit/45ff816212e1043986b54b0e9bd5a78c8cd64628)) - use-the-fork
- _(style)_ Split Monolithic Waybar styling into separate module files - ([22499cc](https://github.com/use-the-fork/dots/commit/22499cc773cc93bff875acc6587ec63c2b4e27ef)) - use-the-fork
- _(style)_ Redefine GTK and QT styling options and configurations - ([c51735b](https://github.com/use-the-fork/dots/commit/c51735b8a762fbed04611c76fee28835900a8bab)) - use-the-fork
- _(system)_ Move nh.nix, update programs, add overlays for nix-output-monitor in workstation - ([3ab9c85](https://github.com/use-the-fork/dots/commit/3ab9c85a1a5a213e1d2da3976f2bd1734d0a1e6d)) - use-the-fork
- _(No Category)_ Replace 'src' references with 'self' in several nix files
- _(No Category)_ Update flake.nix and flake.lock with changes to dependencies and code structure

### <!-- 5 -->🎨 Styling

- _(waybar)_ Update font color and module formats in catppuccin-mocha preset - ([f823ecb](https://github.com/use-the-fork/dots/commit/f823ecb41ed6374c7c0337d2c9e90add412d4555)) - use-the-fork
- _(waybar)_ Adjust spacing and padding in custom and default modules - ([98141ed](https://github.com/use-the-fork/dots/commit/98141eda1a765520df50effe5801d6eedb0e7a01)) - use-the-fork

### <!-- 7 -->🔧 Chores

- _(flake.nix)_ Update devenv url from cachix to use-the-fork - ([07fcd52](https://github.com/use-the-fork/dots/commit/07fcd5218b2c1e893bff737fbd13c05258794d65)) - use-the-fork
- _(gui)_ Remove swaync style.css file - ([3916e07](https://github.com/use-the-fork/dots/commit/3916e073eb0792138b986323414def5fca54844c)) - use-the-fork
- _(gui)_ Remove swaync style.css file - ([4e1df78](https://github.com/use-the-fork/dots/commit/4e1df780a140241f49fcbd401edc5d3d6e7f96e8)) - use-the-fork

### Flake

- _(No Category)_ Bump inputs
- _(No Category)_ Bump inputs

## \[2024-07-01\]

### <!-- 0 -->⛰️ Features

- _(flake)_ Add new attribute transformations to bootstrap RoboNix library - ([b6fc875](https://github.com/use-the-fork/dots/commit/b6fc87526ae6dcc15769b95269bff55b4337b8a2)) - use-the-fork
- _(flake/lib)_ Add sslTemplate and shellColors to aliases.nix - ([9e716d7](https://github.com/use-the-fork/dots/commit/9e716d7e78091b3191bb328b40e4fb30e005a344)) - use-the-fork
- _(flake/lib/helpers)_ Add new helper functions for systemd, filesystem, types, and themes - ([1c68dbb](https://github.com/use-the-fork/dots/commit/1c68dbbc45e1e3604c2d7846cd2934a73c2aad82)) - use-the-fork
- _(flake/packages)_ Add new file default.nix for package configuration - ([eccdb72](https://github.com/use-the-fork/dots/commit/eccdb724ce2bdc71b4ed6fbaebad961c741b4be5)) - use-the-fork
- _(flake/shell)_ Added git-cliff configuration and execution script - ([eff9104](https://github.com/use-the-fork/dots/commit/eff91048c63af60bf1c63bc780f7ec23ed9b33d2)) - use-the-fork
- _(git-cliff)_ Add --bump option to git-cliff command - ([bbc3128](https://github.com/use-the-fork/dots/commit/bbc31282cc010fd5212526670fdf5f010e535f0e)) - use-the-fork
- _(iso-images)_ Add new ISO images configurations file - ([9edc620](https://github.com/use-the-fork/dots/commit/9edc6207982e8d4b30b475efc3c57a20ac66d502)) - use-the-fork
- _(lib)_ Add multiple nix functions and system builders in various categories including builders, services, validators, helpers, hardware, aliases and XDG templates - ([69725c9](https://github.com/use-the-fork/dots/commit/69725c9976aff53256795b1843ded70b3e006aaa)) - use-the-fork
- _(pre-commit)_ Add multiple hooks and utility functions for pre-commit configuration - ([937ddda](https://github.com/use-the-fork/dots/commit/937dddac688f0f9bb93ac7d9c6a78ba7a61ec674)) - use-the-fork
- _(shell)_ Add multiple features including flash, boot, build, test, treefmt, iso, switch, installer in just-flake module - ([2b1fcbd](https://github.com/use-the-fork/dots/commit/2b1fcbd005631bc0f4ef2a96d95ab69fb820a8b8)) - use-the-fork

### <!-- 4 -->🚜 Refactor

- _(flake.nix)_ Update structure and dependencies - ([d4980ed](https://github.com/use-the-fork/dots/commit/d4980ed03005522f7f271c1280dbc1240a5f5f8b)) - use-the-fork
- _(git-cliff)_ Rename 'iso' feature to 'changelog' and update associated description and command - ([25016e3](https://github.com/use-the-fork/dots/commit/25016e38719a4f26d7e2cc2844beb39f753526a5)) - use-the-fork

### <!-- 7 -->🔧 Chores

- _(pre-commit)_ Enable git-cliff hook - ([06c16a1](https://github.com/use-the-fork/dots/commit/06c16a1be6bd3b276ccfa9731e496e0148d61928)) - use-the-fork
- _(pre-commit)_ Enable git-cliff hook - ([1a39338](https://github.com/use-the-fork/dots/commit/1a393388fe00683764d7e30012446e77f7293d47)) - use-the-fork

### \`feat

- _(flake/args)_ Add pinnedSources and publicKeys imports to config\` - ([b9c97d0](https://github.com/use-the-fork/dots/commit/b9c97d0491f1c7052e158cd095cbd3f3c4e646ba)) - use-the-fork

<!-- generated by git-cliff -->
