{
  config,
  pkgs,
  rust-overlay,
  ...
}: {
  imports = [
    ./firefox.nix
    ./rust.nix
  ];
}
