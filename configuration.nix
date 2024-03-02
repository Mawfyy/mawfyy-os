# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./overlays
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  programs.river.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Bogota";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  services.xserver = {
    enable = true;
    layout = "latam";
    xkbVariant = "deadtilde";
    dpi = 96;
  };

  services.xserver.windowManager.leftwm.enable = true;

  services.picom.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.xserver.displayManager.lightdm.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;
  users.defaultUserShell = pkgs.fish;

  console.keyMap = "la-latin1";

  users.users.mawfy = {
    isNormalUser = true;
    description = "mawfy";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  services.xserver.videoDrivers = ["nvidiaLegacy304"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_340;
  };

  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    sqlite
    nodejs_21
    nodePackages_latest.typescript-language-server
  ];

  environment.variables = {
    EDITOR = "hx";
    WALLPAPER = builtins.toString ./wallpaper/wallpaper.jpeg;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = ["gtk"];
      }; 

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };

  services.openssh.enable = true;
  system.stateVersion = "23.05";
}
