{ config, pkgs, ... }:
let 
  name_font = "Breeze_Dark";
in
{

  home.username = "mawfy";
  home.homeDirectory = "/home/mawfy";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
  "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };


  #home.pointerCursor = {
  #  gtk.enable = true;
  #  x11.enable = true;
  #  name = "Breeze_Dark";
  #  size = 48;
  #  package = pkgs.runCommand.run "moveUp" {} ''
  #    mkdir $out/share/icons
  #      ln -s ${builtins.fetchTarball {
  #      url = "https://github.com/polirritmico/Breeze-Dark-Cursor/releases/download/v1.0/Breeze_Dark_v1.0.tar.gz";
  #     sha256 = "";
  #    }} $out/share/icons/${name_font}
  #  '';
  # };

  home.file."/home/mawfy/.config/hypr/hyperpaper.conf".text = ''
    preload=/home/mawfy/Pictures/nixos_logo_rainbow.png
    wallpaper = VGA-1, /home/mawfy/Pictures/nixos_logo_rainbow.png
  '';

  programs.git = {
    enable = true;
    userName = "mawfyy";
    userEmail = "mawfyy16@proton.me";
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    swaybg
   	
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

 

  home.file."/home/mawfy/.config/hypr/hyprland.conf".text = ''
    # See https://wiki.hyprland.org/Configuring/Monitors/
monitor=,preferred,auto,auto


# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = swaybg -i /home/mawfy/Pictures/nixos_logo_rainbow.png

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf


# Some default env vars.
env = XCURSOR_SIZE,24

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = latam
    kb_variant = nodeadkeys
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 2
    gaps_out = 2
    border_size = 1
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 0

    blur {

    enabled = false
    size = 3
    passes = 1
    new_optimizations = true

    }

    drop_shadow = no
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = no

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 0, 7, myBezier
    animation = windowsOut, 0, 7, default, popin 80%
    animation = border, 0, 10, default
    animation = borderangle, 0, 8, default
    animation = fade, 0, 7, default
    animation = workspaces, 0, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic-mouse-v1 {
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, RETURN, exec, alacritty
bind = $mainMod, w, killactive,
bind = $mainMod, X, exit,
bind = $mainMod, V, togglefloating,
bind = $mainMod, M, exec, wofi --show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod, S, exec, grim -g "$(slurp)" - | wl-copy

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
  ''; 

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
