# Things to do post install

## QT theming

Install qt5ct and Kvantum to proper theme QT apps without installing KDE.

## GTK theming

Install lxappearance to theme GTK apps, select icon and cursor themes.

Install adw-gtk3 and adw-gtk-theme from AUR (or manually install them) to theme libadwaita.

_Optional:_ Install Gradience to customize GNOME.

**Flatpak**

Override the following flatpak permissions:

_GTK 4_

```bash
sudo flatpak override --filesystem=xdg-config/gtk-4.0
```

_GTK 3_

```bash
sudo flatpak override --filesystem=xdg-config/gtk-3.0
```

## Use Kitty as a "global terminal"

Symlink Kitty to xterm so CLI apps use kitty instead of xterm (or gnome-terminal).

**_Note: This may break something idk_**

```bash
sudo ln -s /usr/bin/kitty /usr/bin/xterm
```
