# Victor's dotfiles

Victor Talamantes' bare git repo with personal configuration files.

**What are dotfiles?**
Configuration files with a dot prefix (.) used to personalize your Linux or other Unix-based systems.

# Who am I?

I am Victor Talamantes, CEO of Binmatter and founder of Indies Mexico. I'm a programmer and I've worked on hundreds of software projects. I fell in love recently with everything FOSS related and this is my first public repo. 

**You can find more about my work here:**

[![Binmatter Demo Reel](https://img.youtube.com/vi/zoMKZ0fcpeI/0.jpg)](https://www.youtube.com/watch?v=zoMKZ0fcpeI)

| URL                              | Description                          |
| -------------                    | -----------                          |
| https://www.binmatter.com        | Apps and videogames company          |
| https://www.indies.mx            | Mexican videogames initiative        |
| https://www.victortalamantes.com | Personal blog (spanish)              |

<br>

# Current Setup
- **OS**: CachyOS (Arch Linux)
- **WM**: niri (Wayland compositor)
- **Launcher**: noctalia
- **Terminal**: Ghostty (Dracula theme, JetBrainsMono Nerd Font)
- **Shell**: Fish (primary) + Bash (script compatibility)
- **Prompt**: Starship

# Usage
If you are interested in any of my config files, feel free to take a look at them.<br>
**The following is the way you can configure a bare repo as mine and/or clone these files to your system.**

### Installer scripts
- **Arch Linux / CachyOS**: `./arch_installer.sh` — installs packages, sets up fish, and clones the dotfiles repo.
- **Fedora**: `./fedora_installer.sh` — installs packages and configures the dotfiles repo.

### Manual setup
```bash
git init --bare $HOME/.dotfilesgit
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

Add the alias to your shell config:
```bash
# For fish (primary)
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfilesgit/ --work-tree=\$HOME'" >> ~/.config/fish/config.fish

# For bash (fallback)
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfilesgit/ --work-tree=\$HOME'" >> ~/.bashrc
```

### Installing on a new system
```bash
git clone --bare https://github.com/talamantesvictor/dotfiles.git $HOME/.dotfilesgit
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### Adding files
```bash
dotfiles add .config/ghostty/config
dotfiles commit -m "add ghostty config"
dotfiles push
```
<br>
# Acknowledgment
Special thanks to Derek Taylor from [DistroTube](https://www.youtube.com/c/DistroTube) for his great content.

# Donations
I take pride in being able to help people with the knowledge I have gained over the years. I would gladly appreciate a coffee (or beer) from you.

<a href='https://ko-fi.com/Q5Q4D7835' target='_blank'><img height='44' style='border:0px;height:44px;' src='https://cdn.ko-fi.com/cdn/kofi3.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

# License
The files and scripts in this repository are licensed under the MIT License.
