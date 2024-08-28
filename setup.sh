#!/usr/bin/env bash

# Symlink configuration files
symlinkconfig() {
    f="$1"
    target="$HOME/.config/$f"
    source="$PWD"/"$f"

    # Check if the target already exists
    if [ -e "$target" ]; then
        echo "$target already exists."

        # Optionally, check if it is a symlink
        if [ -L "$target" ]; then
            echo "$target is already a symlink."
        else
            echo "$target exists but is not a symlink."
        fi
    else
        # Create the symlink if the target does not exist
        ln -s "$source" "$target"
        echo "Symlink created: $source -> $target"
    fi
}

symlinkconfig kitty
symlinkconfig alacritty
symlinkconfig zsh
symlinkconfig starship.toml
symlinkconfig scripts
symlinkconfig hypr
symlinkconfig waybar
symlinkconfig git

# zshenv symlink
if [ -e "$HOME/.zshenv" ] || [ -L "$HOME/.zshenv" ]; then
    echo "$HOME/.zshenv already exists."
else
    ln -s "$PWD/zshenv/.zshenv" "$HOME/.zshenv"
fi
