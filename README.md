<h1 align="center">Dotfiles</h1>

Configuration files for my linux setup.

![](https://raw.githubusercontent.com/brunoanesio/hyprland-config/main/screenshot/hyprland.png)

## About

- Window Manager: [Hyprland](https://github.com/hyprwm/Hyprland), [config](https://github.com/brunoanesio/hyprland-config)
- Bar: [Waybar](https://github.com/Alexays/Waybar)
- Shell: zsh - prompt: [Starship](https://github.com/starship/starship)
- Editor: [Neovim (0.8)](https://github.com/neovim/neovim), [config](https://github.com/brunoanesio/nvim-config)
- File manager: [Thunar](https://gitlab.xfce.org/xfce/thunar)
- Font: Iosevka (SS07 variant)
- Terminal: [Kitty](https://github.com/kovidgoyal/kitty/)
- Notifications: [dunst](https://github.com/dunst-project/dunst)
- Launcher: [rofi](https://github.com/davatorium/rofi)
- GTK theme: [catppuccin](https://github.com/catppuccin/gtk)
- Document Viewer: [zathura](https://git.pwmt.org/pwmt/zathura)

## Installation

**Packages**

```bash
# Packages avaiable on Arch repositories
pacman -S thunar thunar-volman thunar-archive-plugin lxappearance-gtk3 playerctl tumbler dunst polkit-gnome pavucontrol network-manager-applet zathura stow starship zsh neovim kitty
```

```bash
# Packages avaiable through the AUR
paru -S hyprland-git hyprpicker-git grimblast-git rofi-lbonn-wayland swaylock-effects waybar-hyprland-git
```

**Configuration files**

Install using stow, symlink the files or copy them to ~/.config
