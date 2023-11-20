# Editor
export EDITOR=nvim

# diff prog
export DIFFPROG="nvim -d"

# Path
export PATH=$HOME/.config/emacs/bin:$HOME/.spicetify:$HOME/.local/share/npm/bin:$HOME/.local/share/cargo/bin:$HOME/.local/bin:$PATH

# Pfetch
export PF_INFO="ascii title os kernel wm editor shell uptime pkgs memory"

# gpg
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GPG_TTY=$(tty)

# Enviroment variables
# XDG export
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
# Cleaning $HOME
export PYTHONSTARTUP="/etc/python/pythonrc"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export ZDOTDIR=$HOME/.config/zsh
# export WINEPREFIX="$XDG_DATA_HOME"/wine
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
# export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GOPATH="$XDG_DATA_HOME"/go
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
# export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export DOOMDIR="$XDG_CONFIG_HOME"/doom
# Rust
. "/home/frost/.local/share/cargo/env"
