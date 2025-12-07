# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User-specific PATH configuration
# Ensure user-local bin directories are at the front of PATH
add_to_path() {
  case ":$PATH:" in
  *:"$1":*) ;; # already in PATH
  *) PATH="$1:$PATH" ;;
  esac
}

add_to_path "$HOME/.local/bin"
add_to_path "$HOME/bin"
add_to_path "$HOME/.cargo/bin"
unset -f add_to_path

export PATH

# Optional: disable systemd auto-paging for systemctl
# export SYSTEMD_PAGER=

# Load additional user-specific bash configuration fragments (if any)
if [ -d "$HOME/.bashrc.d" ]; then
  for rc in "$HOME"/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# History search with ↑ and ↓ (prefix-based)
if [[ $- == *i* ]]; then
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi

# History settings
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Aliases (prefer exa if available)
if command -v exa >/dev/null 2>&1; then
  alias ls='exa --icons --group-directories-first'
  alias la='exa -lah --icons --group-directories-first'
  alias lt='exa -T --level=2 --icons'
else
  alias ls='ls --color=auto'
  alias la='ls -lah --color=auto'
fi

# Starship prompt initialization (only if installed)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi
