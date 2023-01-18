# Things to do post install

## QT theming

Install qt5ct,qt6ct and Kvantum to proper theme QT apps without installing KDE.

## GTK theming

Install lxappearance to theme GTK apps, select icon and cursor themes.

Install Gradience to theme libadwaita.

**Flatpak**

Override the following flatpak permissions:

```bash
# GTK 4
sudo flatpak override --filesystem=xdg-config/gtk-4.0
# GTK 3
sudo flatpak override --filesystem=xdg-config/gtk-3.0
```

## Use Kitty as a "global terminal"

Symlink xterm to Kitty so GUI apps use kitty instead of xterm (or gnome-terminal).

**_Note: This may break something idk_**

```bash
sudo ln -s /usr/bin/kitty /usr/bin/xterm
```
