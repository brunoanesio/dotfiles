#!/usr/bin/env bash

# Symlink configuration files
symlinkconfig() {
    f="$1"
    target="$HOME/.config/$f"
    source="$PWD"/"$f"

    # Check if the target already exists
    if [ -e "$target" ]; then
        echo "$target already exists."
    else
        # Create the symlink if the target does not exist
        ln -s "$source" "$target"
        echo "Symlink created: $source -> $target"
    fi
}

symlinkconfig kitty
symlinkconfig alacritty
symlinkconfig zsh
# symlinkconfig ohmyposh
symlinkconfig starship
symlinkconfig hypr
symlinkconfig waybar
symlinkconfig git
symlinkconfig bat
symlinkconfig dunst

# zshenv symlink
if [ ! -e "$HOME/.zshenv" ] || [ ! -L "$HOME/.zshenv" ]; then
    ln -s "$PWD/zshenv/.zshenv" "$HOME/.zshenv"
fi

# symlink scripts
ln -s "$PWD/scripts/killwindow.sh" "$HOME/.local/bin/killwindow"
