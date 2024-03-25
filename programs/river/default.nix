{
  config,
  pkgs,
  ...
}: {
  home.file.".config/river/init".source = ./init;
}
