# gpg and ssh
export GPG_TTY=$TTY
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
# Enable colors
autoload -U colors && colors

# Aliases
source $HOME/.config/zsh/.aliases

# Prompt
eval "$(starship init zsh)"

# >>> conda init >>>
# if [ -f "$PWD/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
#     . "$PWD/.local/share/miniconda3/etc/profile.d/conda.sh"
# else
#     \export PATH="$PWD/.local/share/miniconda3/bin/conda:$PATH"
# fi
# <<< conda init <<<

# zap source
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# fpath
fpath+=~/.config/zsh/zfunc/
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

# fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# zoxide
eval "$(zoxide init --cmd cd zsh)"
# antidot
#eval "$(antidot init)"
