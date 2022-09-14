<h1 align="center">Welcome to my dotfiles🐧</h1>

Configuration files for my linux setup.
Currently I use [qtile](https://github.com/qtile) with [Catppuccin](https://github.com/catppuccin).

![qtile](./screenshots/qtile-catppuccin.png)

## About

- Window Manager: [qtile](https://github.com/qtile/qtile)
- Compositor: [picom](https://github.com/yshui/picom)
- Shell: zsh - [Starship](https://github.com/starship/starship)
- Editor: [Neovim (nightly)](https://github.com/neovim/neovim)
- File manager: [Ranger](https://github.com/ranger/ranger), Thunar
- Font: [Iosevka Mayukai](https://github.com/Iosevka-Mayukai/Iosevka-Mayukai)
- Terminal: [Kitty](https://github.com/kovidgoyal/kitty/)
- Notifications: [dunst](https://github.com/dunst-project/dunst)
- Launcher: [rofi](https://github.com/davatorium/rofi)
- GTK theme: [catppuccin](https://github.com/catppuccin/gtk)
- Document Viewer: [zathura](https://git.pwmt.org/pwmt/zathura)

## Installation

_Packages_

```bash
# Packages avaiable in the arch repo's
pacman -S qtile rofi thunar thunar-volman thunar-archive-plugin python-psutil ranger lxappearance-gtk3 nitrogen playerctl tumbler dunst polkit-gnome pavucontrol numlockx network-manager-applet zathura stow starship zsh zsh-completions zsh-history-substring-search zsh-syntax-highlighting
```

```bash
# Packages avaiable through the AUR
paru -S qtile-extras-git neovim-git picom-git cava
```

**Symlink the configuration files**

_Using Stow_

```bash
# Use stow to properly and easily symlink the config files
stow config
```

_Manual symlink_

```bash
# or just manually symlink it
ln -s $HOME/.dotfiles/config/.config/file $HOME/.config/file
```
