# Enable colors
autoload -U colors && colors

# Aliases
source $HOME/.config/zsh/.aliases

# Prompt
eval "$(starship init zsh)"

# >>> conda init >>>
if [ -f "$PWD/.local/share/anaconda3/etc/profile.d/conda.sh" ]; then
    . "$PWD/.local/share/anaconda3/etc/profile.d/conda.sh"
else
    \export PATH="$PWD/.local/share/anaconda3/bin/conda:$PATH"
fi
# <<< conda init <<<

# zap source
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Load plugins
export ZDOTDIR=$HOME/.config/zsh
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/completions"
plug "zap-zsh/vim"

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

# Bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
