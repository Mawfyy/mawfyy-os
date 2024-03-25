{pkgs, ...}: {
  imports = [
    ./programs/river
  ];

  programs.git = {
    enable = true;
    userName = "Mawfyy";
    userEmail = "94380448+Mawfyy@users.noreply.github.com";
    extraConfig = {
        user.signingkey = "94380448+Mawfyy@users.noreply.github.com";
        commit.gpgsign = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    swaybg
    zellij
    bemenu
    joshuto
    wineWowPackages.stable
    feh
    just
    zip
    xz
    unzip
    p7zip
    nix-output-monitor
    glow
    btop
    xfce.thunar
    lutris
    grim
    slurp
    wl-clipboard
    zathura

    #fonts
    nerdfonts
    iosevka

    brave

    (discord.override {
      withVencord = false;
      withOpenASAR = true;
    })
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "everforest_dark";
      editor = {
        bufferline = "always";
      };
    };
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "typescript";
          auto-format = true;
        }
        {
          name = "cpp";
        }
        {
          name = "gleam";
          auto-format = true;
        }
        {
          name = "nix";
          auto-format = true;
        }
      ];
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        dynamic_padding = true;
        opacity = 0.9;
      };
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        normal = {
          family = "Iosevka";
          style = "Light";
        };

        bold = {
          family = "Iosevka";
          style = "Medium";
        };

        italic = {
          family = "Iosevka";
          style = "Light Italic";
        };
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
