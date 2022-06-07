export ZSH="/home/victor/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases

alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first' 
alias la='exa -la --color=always --group-directories-first' 

# Confirm before removing something
alias rm='rm -i'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'

alias vim='nvim'

alias notes='nvim +"cd /mnt/media/notes"'

eval "$(starship init zsh)"
