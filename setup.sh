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
symlinkconfig ohmyposh
symlinkconfig hypr
symlinkconfig waybar
symlinkconfig git
symlinkconfig bat

# zshenv symlink
if [ ! -e "$HOME/.zshenv" ] || [ ! -L "$HOME/.zshenv" ]; then
    ln -s "$PWD/zshenv/.zshenv" "$HOME/.zshenv"
fi

# symlink scripts
ln -s "$PWD/scripts/killwindow.sh" "$HOME/.local/bin/killwindow"
