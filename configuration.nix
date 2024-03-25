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

  services.mullvad-vpn.enable = true;
  networking.nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" "8.8.8.8"];


  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" "8.8.8.8"];
    dnsovertls = "true";
  };

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

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.xserver.displayManager = {
    lightdm.enable = true;
    autoLogin = {
      enable = true;
      user = "mawfy";
    };
  };

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
    packages = [];
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

  services.dbus.enable = true;

  environment.systemPackages = with pkgs; [
    sqlite
    nodejs_21
    nodePackages_latest.typescript-language-server
    nil
    
    pinentry-curses
  ];

  fonts.fonts = with pkgs; [
    nerdfonts
    iosevka
  ];

  environment.variables = {
    EDITOR = "hx";
    WALLPAPER = builtins.toString ./wallpaper/wallpaper.jpeg;
  };


   programs.gnupg.agent = {
	  enable = true;
	  enableSSHSupport = true;
	  pinentryFlavor = "tty";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
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
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };

  services.openssh.enable = true;
  system.stateVersion = "23.05";
}
