#!/usr/bin/env bash
set -e

echo "Enabling Ghostty COPR repository..."
# Ignore failure if already enabled
sudo dnf copr enable pgdev/ghostty || echo "COPR already enabled or unavailable, continuing..."

echo "Installing Ghostty..."
sudo dnf install -y ghostty

echo "Installing Nautilus Python support..."
sudo dnf install -y nautilus-python

echo "Creating Nautilus extension: 'Open in Ghostty Here'..."
mkdir -p ~/.local/share/nautilus-python/extensions

cat >~/.local/share/nautilus-python/extensions/open_in_ghostty.py <<'EOF'
from gi.repository import Nautilus, GObject
import subprocess
import os

class OpenInGhosttyExtension(GObject.GObject, Nautilus.MenuProvider):
    """Adds 'Open in Ghostty Here' to the Nautilus context menu."""

    def _launch_ghostty(self, file):
        """Launch Ghostty using the correct working directory."""
        if file.is_directory():
            path = file.get_location().get_path()
        else:
            path = os.path.dirname(file.get_location().get_path())

        subprocess.Popen(["ghostty", "--working-directory", path])

    def get_file_items(self, window, files):
        """Context menu entry when right-clicking a file/folder."""
        if len(files) != 1:
            return

        item = Nautilus.MenuItem(
            name="OpenInGhosttyExtension::OpenInGhostty",
            label="Open in Ghostty Here",
        )
        item.connect("activate", self._launch_ghostty, files[0])
        return [item]

    def get_background_items(self, window, file):
        """Context menu entry when right-clicking inside a folder (background)."""
        item = Nautilus.MenuItem(
            name="OpenInGhosttyExtension::OpenInGhosttyBg",
            label="Open in Ghostty Here",
        )
        item.connect("activate", self._launch_ghostty, file)
        return [item]
EOF

echo "Restarting Nautilus..."
pkill nautilus || true

echo "Installing exa..."
sudo dnf install -y cargo
cargo install exa
echo "exa installed successfully."

echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "Starship installed successfully. (shell init handled in bashrc)"

echo "✔ All components installed successfully."
echo "   - Ghostty installed"
echo "   - Nautilus extension added"
echo "   - exa installed"
echo "   - Starship installed"

# Reload bash configuration
source ~/.bashrc
echo "✔ Shell configuration reloaded."
