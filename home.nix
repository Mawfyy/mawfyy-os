{ config, pkgs, ... }:

{

  home.username = "mawfy";
  home.homeDirectory = "/home/mawfy";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  
  programs.git = {
    enable = true;
    userName = "mawfyy";
    userEmail = "mawfyy16@proton.me";
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    #cursor
    bibata-cursors
   	
    joshuto
    wineWowPackages.stable 

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb



    hyprpaper
    discord
    spotify
    xfce.thunar
    lutris
    alacritty
    brave
    wofi
    grim
    slurp
    wl-clipboard

    #fonts
    nerdfonts
    iosevka
  ];

   programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
    };
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
      ];
    };
  };


  programs.wofi.enable = true;

  
  programs.alacritty = {
    enable = true;
    settings = {
    window = {
      dynamic_padding = true;
      opacity = 0.9;
    };
    background-opacity = 1.0;
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        normal = {
          family = "Iosevka";
          style = "Light";
        };

        bold = {
          family =  "Iosevka";
          style = "Medium";
        };

        italic = {
          family = "Iosevka";
          style = "Light Italic";
        };
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
