# Getting started
> [!IMPORTANT]
You should already installed nixOS.


### What i use on my workflow?
- riverWM (compositor wayland)
- alacritty (terminal)
- grim + slurp (screenshots)
- bemenu (menu runner)

# Shorcuts

| SHORCUT  | PROGRAM TO EXECUTE |
| ------------- | ------------- |
| MOD + ENTER  | terminal  |
| MOD + M  | menu runner  |
| MOD + S  | screenshot  |

-----

### How to install?

clone this repo into a folder called "nixos"

```bash
git clone https://github.com/Mawfyy/mawfyy-os nixos
```

Copy your hardware-configuration.nix into this repo

```bash
cd /etc/nixos && cp hardware-configuration.nix /path/to/this/repo
```

Rename the folder /etc/nixos to nixos.bak

```bash
cd /etc && sudo mv nixos nixos.bak
```
Make a symbolic link from this repo to nixos

```bash
sudo ln -s /path/to/this/repo /etc/nixos
```

Preview

![image](https://github.com/Mawfyy/nixos-dotfiles/assets/94380448/9963ebb7-7dae-4094-bb41-6ecd18d8e3d9)

Yes, i'm bocchi the rock fan.

![image](https://github.com/Mawfyy/mawfyy-os/assets/94380448/66296ea1-6083-4022-a5ab-e485a6988b0d)

