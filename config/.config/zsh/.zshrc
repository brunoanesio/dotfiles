# Completion

_comp_options+=(globdots)
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'
zstyle ':completion:*' menu yes select
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# Lines configured by zsh-newuser-install
HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history
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
source $HOME/.config/zsh/.aliases

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/frost/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/frost/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/frost/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/frost/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

