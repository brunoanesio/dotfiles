<h1 align="center">Dotfiles</h1>

Configuration files for my linux setup.

![](https://raw.githubusercontent.com/brunoanesio/hyprland-config/main/screenshot/hyprland.png)

## About

- Window Manager: [Hyprland](https://github.com/hyprwm/Hyprland), [config here](https://github.com/brunoanesio/hyprland-config)
- Bar: [eww](https://github.com/elkowar/eww)
- Shell: zsh - prompt: [Starship](https://github.com/starship/starship)
- Editor: [Neovim](https://github.com/neovim/neovim), [config here](https://github.com/brunoanesio/nvim-config)
- File manager: [Thunar](https://gitlab.xfce.org/xfce/thunar)
- Font: Iosevka
- Terminal: [Kitty](https://github.com/kovidgoyal/kitty/)
- Notifications: [dunst](https://github.com/dunst-project/dunst)
- Launcher: [anyrun](https://github.com/Kirottu/anyrun)
- GTK theme: [catppuccin](https://github.com/catppuccin/gtk)
- Document Viewer: [zathura](https://git.pwmt.org/pwmt/zathura)

## Installation

**Packages**

```bash
# Packages avaiable on Arch repositories
pacman -S thunar thunar-volman thunar-archive-plugin tumbler playerctl dunst polkit-kde-agent \
pavucontrol zathura starship zsh neovim kitty hyprland
```

```bash
# Packages avaiable through the AUR
paru -S hyprpicker-git grimblast-git rofi-lbonn-wayland wlogout jaq anyrun-git swww \
eww-wayland xdg-desktop-portal-hyprland-git
```

**Configuration files**

Install using stow, symlink the files or copy them to ~/.config
