# Victor's dotfiles

Victor Talamantes' bare git repo with personal configuration files.

**What are dotfiles?**
Configuration files with a dot prefix (.) used to personalize your Linux or other Unix-based systems.

# Who am I?

![Victor Talamantes](https://www.victortalamantes.com/content/images/2021/03/victor-cartoonish-250.png)

I am Victor Talamantes, CEO of Binmatter and founder of Indies Mexico. I'm a programmer and I've worked on hundreds of software projects. I fell in love recently with everything FOSS related and this is my first public repo. 

**You can find more about my work here:**

[![Binmatter Demo Reel](https://img.youtube.com/vi/zoMKZ0fcpeI/0.jpg)](https://www.youtube.com/watch?v=zoMKZ0fcpeI)

| URL                              | Description                          |
| -------------                    | -----------                          |
| https://www.binmatter.com        | Apps and videogames company          |
| https://www.indies.mx            | Mexican videogames initiative        |
| https://www.victortalamantes.com | Personal blog (spanish)              |

<br>

# Usage
If you are interested in any of my config files, feel free to take a look at them.<br>
**The following is the way you can configure a bare repo as mine and/or clone this files to your system.**

### Create a bare repository
`git init --bare $HOME/.dotfilesgit`<br>
`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'`<br>
Optionally, we can add our new alias to zsh config file so we don't have to run the command above everytime a shell session is started.<br>
`echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'" >> $HOME/.zshrc`<br>
Using our new alias to complete the configuration by running git commands...<br>
`dotfiles config --local status.showUntrackedFiles no'`<br>
For adding files to our repo, eg .vimrc file:<br>
`dotfiles add .vimrc`<br>
Now we can just add our commit, set the remote and push.<br>
`dotfiles commit -m "add .vimrc"`<br>
...

### Installing
Avoid recursive issues by adding .dotfilesgit to global git ignore.<br>
`echo ".dotfilesgit" >> .gitignore`<br>
Clone this repo using https or ssh<br>
`git clone --bare https://github.com/talamantesvictor/dotfiles.git $HOME/.dotfilesgit`<br>
Create an alias to run git commands for this repo<br>
`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'`<br>
No tracking<br>
`dotfiles config --local status.showUntrackedFiles no'`<br>
Git checkout<br>
`dotfiles checkout`
<br>
# Acknowledgment
Special thanks to Derek Taylor from [DistroTube](https://www.youtube.com/c/DistroTube) for his great content.

# Donations
I take pride in being able to help people with the knowledge I have gained over the years. I would gladly appreciate a coffee or beer from you.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/talamantesvic)

# License
The files and scripts in this repository are licensed under the MIT License.
