# Completion

_comp_options+=(globdots)
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/frost/.zshrc'
zstyle ':completion:*' menu yes select
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
fpath+=~/.zfunc
compinit

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt notify
bindkey -e
# End of lines configured by zsh-newuser-install

# Enable colors
autoload -U colors && colors

# Load plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

# Aliases
source $HOME/.aliases

# Bindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Prompt
eval "$(starship init zsh)"

# Spicetify path
export PATH=$PATH:/home/frost/.spicetify

# precmd () {print -Pn "\e]0;%~\a"}
