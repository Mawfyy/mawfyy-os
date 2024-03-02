{
  config,
  pkgs,
  ...
}: let
  firefox-pkgs = pkgs.firefox-devedition-unwrapped.override {
    pipewireSupport = true;
  };
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };
}
