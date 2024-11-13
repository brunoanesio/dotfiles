#!/usr/bin/env bash

# Symlink configuration files
symlinkconfig() {
  f="$1"
  t="$2"
  source="$PWD"/"$f"
  target="$HOME/$t/$(basename "$f")"

  # Check if the target already exists
  if [ -e "$target" ]; then
    echo "$target already exists."
  else
    # Create the symlink if the target does not exist
    ln -s "$source" "$target"
    echo "Symlink created: $source -> $target"
  fi
}

# create .local/bin if it doesn't exist
if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p "$HOME/.local/bin"
fi
# and .config
if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi

symlinkconfig bat .config
symlinkconfig git .config
symlinkconfig kitty .config
symlinkconfig nvim .config
symlinkconfig rofi .config
symlinkconfig scripts/killwindow .local/bin
symlinkconfig swayimg .config
symlinkconfig swaync .config
symlinkconfig wlogout .config
symlinkconfig zathura .config
symlinkconfig zsh .config
symlinkconfig zshenv/.zshenv .

setup waybar
if [ ! -e "$HOME/.config/waybar" ] || [ ! -L "$HOME/.config/waybar" ]; then
  git clone "https://github.com/brunoanesio/waybar.git" "$HOME/.config/waybar"
fi
