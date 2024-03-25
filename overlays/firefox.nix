{
  config,
  pkgs,
  ...
}: let
  firefox-pkgs = pkgs.firefox-unwrapped.override {
    pipewireSupport = true;
  };
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };
}
