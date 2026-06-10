#!/usr/bin/env bash
set -e

echo "==> Installing core packages..."
sudo pacman -S --needed --noconfirm \
    ghostty \
    ttf-firacode-nerd \
    vlc \
    starship \
    eza \
    fish \
    neovim \
    git

echo "==> Installing AUR packages (zen-browser)..."
paru -S --needed --noconfirm zen-browser-bin

echo "==> Changing default shell to fish..."
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish
    echo "Default shell changed to fish. Log out and back in to apply."
fi

echo "==> Setting up LazyVim..."
if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
    rm -rf "$HOME/.config/nvim/.git"
    echo "LazyVim cloned to ~/.config/nvim. Open nvim to install plugins."
else
    echo "~/.config/nvim already exists, skipping."
fi

echo "==> Setting up dotfiles bare repo..."
if [ ! -d "$HOME/.dotfilesgit" ]; then
    git clone --bare https://github.com/talamantesvictor/dotfiles.git "$HOME/.dotfilesgit"
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'

    # Add alias to bashrc
    echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfilesgit/ --work-tree=\$HOME'" >> "$HOME/.bashrc"

    # Add alias to fish config
    mkdir -p "$HOME/.config/fish"
    echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfilesgit/ --work-tree=\$HOME'" >> "$HOME/.config/fish/config.fish"

    # Checkout files
    /usr/bin/git --git-dir="$HOME/.dotfilesgit/" --work-tree="$HOME" config --local status.showUntrackedFiles no
    /usr/bin/git --git-dir="$HOME/.dotfilesgit/" --work-tree="$HOME" checkout -f

    echo "Dotfiles checked out successfully."
else
    echo "Dotfiles repo already exists at ~/.dotfilesgit. Pulling latest..."
    /usr/bin/git --git-dir="$HOME/.dotfilesgit/" --work-tree="$HOME" pull
fi

echo "==> All done!"
echo "   - Ghostty installed"
echo "   - FiraCode Nerd font installed (JetBrainsMono from .fonts/)"
echo "   - VLC installed"
echo "   - Zen Browser installed"
echo "   - Neovim + LazyVim configured"
echo "   - Fish set as default shell"
echo "   - Starship prompt configured"
echo "   - Dotfiles repo cloned and checked out"
