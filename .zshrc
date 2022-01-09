# Completion

_comp_options+=(globdots)
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/frost/.zshrc'
zstyle ':completion:*' menu yes select
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
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

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
source $HOME/.aliases

# Editor
export EDITOR=nvim

# Prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
	user
	host
	dir
	git
	package
	node
	docker
	venv
	conda
	pyenv
	vi_mode
	jobs
	exit_code
	char
)

SPACESHIP_RPROMPT_ORDER=(
	time
	exec_time
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
