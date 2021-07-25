# Victor's dotfiles

Victor Talamantes bare git repo for my personal configuration files.

# What are dotfiles?
Configuration files with a dot prefix (.) used to personalize your Linux or other Unix-based systems.

# Who am I?

![Victor Talamantes](https://www.victortalamantes.com/content/images/2021/03/victor-cartoonish-250.png)

I am Victor Talamantes, CEO of Binmatter and founder of Indies Mexico. I'm a programmer and I've worked on hundreds of software projects. I fell in love with everything FOSS related lately and this is my first public repo. 

**You can find more about my work here:**

[![Binmatter Demo Reel](https://img.youtube.com/vi/zoMKZ0fcpeI/0.jpg)](https://www.youtube.com/watch?v=zoMKZ0fcpeI)

| URL                              | Description                          |
| -------------                    | -----------                          |
| https://www.binmatter.com        | Apps and videogames company          |
| https://www.indies.mx            | Mexican videogames initiative        |
| https://www.victortalamantes.com | Personal blog (spanish)              |

<br>

# Usage
If you are interested in any of my config files, take a look at them.
**The following is the way you can configure a bare repo as mine and/or clone this files to your system.**

### Create a bare repository
`git init --bare $HOME/.dotfilesgit`
`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'`
Optionally, we can add our new alias to zsh aliases file so we don't have to run the command above everytime a shell session is started.
`echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'" >> $HOME/.zsh/aliases`
Using our new alias to complete the configuration by running git commands...
`dotfiles config --local status.showUntrackedFiles no'`
For adding files to our repo, eg .vimrc file:
`dotfiles add .vimrc`
Now we can just add our commit, set the remote and push.
`dotfiles commit -m "add .vimrc"`
...

### Installing
Avoid recursive issues by adding .dotfilesgit to global git ignore.
`echo ".dotfilesgit" >> .gitignore`
Clone this repo using https or ssh
`git clone --bare https://github.com/talamantesvictor/dotfiles.git $HOME/.dotfilesgit`
Create an alias to run git commands for this repo
`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'`
No tracking
`dotfiles config --local status.showUntrackedFiles no'`
Git checkout
`dotfiles checkout`
<br>
# Acknowledgment
Special thanks to Derek Taylor from [DistroTube](https://www.youtube.com/c/DistroTube) for his great content, and Gabrielle Young for her article [The best way to store your dotfiles](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained).

# License
The files and scripts in this repository are licensed under the MIT License, which is a very permissive license allowing you to use, modify, copy, distribute, sell, give away, etc. the software. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
