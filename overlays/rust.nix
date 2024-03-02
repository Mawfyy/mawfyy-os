{
  config,
  pkgs,
  rust-overlay,
  ...
}: let
  rust-pkg = pkgs.rust-bin.stable.latest.default.override {
    targets = ["wasm32-unknown-unknown"];
  };
in {
  nixpkgs.overlays = [
    rust-overlay.overlays.default
  ];

  environment.systemPackages = with pkgs;[
      rust-pkg
      pkg-config
      openssl
      gcc
      rust-analyzer  
    ];
}
