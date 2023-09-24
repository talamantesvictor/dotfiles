# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias la='exa -la --color=always --group-directories-first'

# confirm before removing something
alias rm='rm -i'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'

alias vim='nvim'

# alias notes='nvim +"cd /mnt/mediadrive/notes"'

# append history instead of overwriting the file
shopt -s histappend
# terminal colors and styling
eval "$(starship init bash)"
# run fetchmastet 6000 when opening a new terminal instance
fm6000 --random --color magenta

