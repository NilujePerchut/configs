# Colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
(( $+commands[dircolors] )) && eval "$(dircolors -b)"
ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# enable diff color if possible.
if command diff --color /dev/null /dev/null &>/dev/null; then
  alias diff='diff --color'
fi

# Misc
setopt autocd
setopt multios

# Setup completions
autoload -Uz compinit
compinit
# Completion select using arrows
zstyle ':completion:*:*:*:*:*' menu select
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# history
# The file where the history is stored
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

export PATH=$PATH:${HOME}/configs/bin

# Load spaceship
eval "$(starship init zsh)"

# Load zsh-autosuggestions
[ ! -e /etc/nixos ] && source ${HOME}/configs/build/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source ${HOME}/configs/zsh/aliases.zsh

# Set the default editor to vim/neovim
export EDITOR=vim

# Enable Ctrl-R
bindkey -v
bindkey "^R" history-incremental-search-backward

# Make Home and End key work
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

[ -f ${HOME}/.zshsp ] && source ${HOME}/.zshsp

[ ! -e /etc/nixos ] && source ${HOME}/configs/build/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
