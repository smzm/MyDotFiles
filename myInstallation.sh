#!/bin/bash

# ================================= DONT USE THIS FILE FOR INSTALLATION 
dotfiles=`echo $PWD`
mkdir -p ~/tmpInstall


sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git wget yajl curl binutils


# YAY
cd ~/tmpInstall
git clone https://aur.archlinux.org/yay.git 
cd yay
makepkg -si

yay --save --nocleanmenu --nodiffmenu


# ZSH
sudo pacman -S zsh --noconfirm
sudo usermod -s /usr/bin/zsh $(whoami)
sudo chsh -s $(which zsh)

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# starship
curl -sS https://starship.rs/install.sh | sh
cp $dotfiles/.config/starship.toml ~/.config/

# zshrc 
cp $dotfiles/.zshrc $dotfiles/.zshenv ~
source ~/.zshrc

# node
sudo pacman -S nodejs npm yarn --noconfirm
mkdir ~/.npm
npm config set prefix ~/.npm

# ruby 
sudo pacman -S ruby --noconfirm
echo "gem: --user-install" >> ~/.gemrc
sudo gem update

# Python
sudo pacman -S python python-pip jupyter-notebook python-ipykernel --noconfirm

# PIP, NPM, YARN
pip install numpy pandas scipy sympy matplotlib plotly jedi python-language-server[all]
sudo npm i -g pyright vim-language-server vscode-langservers-extracted typescript typescript-language-server awk-language-server dockerfile-language-server-nodejs emmet-ls bash-language-server
yarn global add yaml-language-server

# NVIM
yay -S tailwind-css tailwindcss-language-server
sudo pacman -S pyenv neovim python-pynvim --noconfirm
python3 -m pip install --user --upgrade pynvim
sudo pip3 install pynvim --upgrade
npm install -g neovim
gem install neovim

# VIM-PLUG
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p $HOME/.config/nvim
yes | cp -rf $dotfiles/.config/nvim/* ~/.config/nvim/

# Fonts
yay -S nerd-fonts-inconsolata nerd-fonts-fira-code apple-fonts ttf-font-awesome vazirmatn-fonts noto-fonts-emoji
sudo cp $dotfiles/local.conf /etc/fonts/local.conf
fc-cache -v

# Install feather font
mkdir -p $HOME/.fonts
yes | cp -rf $dotfiles/.fonts/* $HOME/.fonts/
fc-cache -fv

# pacman packages
sudo pacman -S trash-cli lsd tmux aria2 broot ripgrep peco ack lostfiles github-cli tldr kitty zathura mpv xbindkeys xdotool thunar lxappearance xfce4-power-manager xfce4-settings nitrogen viewnior gtk3 ntfs-3g exfat-utils --noconfirm


# yay packages
yay -S xbindkeys_config-gtk2 fluent-reader udevil

# trash-cli
sudo mkdir --parent /.Trash
sudo chmod a+rw /.Trash
sudo chmod +t /.Trash
(crontab -l ; echo "@daily $(which trash-empty) 30") | crontab -

#tmux
yes | cp -rf $dotfiles/.tmux.conf ~/

# gh
gh auth login

# bin
cp -r $dotfiles/bin ~

# kitty
mkdir -p ~/.config/kitty
yes | cp -rf $dotfiles/.config/kitty/* ~/.config/kitty/
sleep 3

# Zathura
mkdir -p ~/.config/zathura
yes | cp -rf $dotfiles/.config/zathura/* ~/.config/zathura
sudo pacman -S zathura-pdf-mupdf 

# MPV
mkdir ~/.config/mpv/
yes | cp -rf $dotfiles/.config/mpv/* ~/.config/mpv/
yes | cp -rf $dotfiles/.xbindkeysrc ~/.xbindkeysrc

# Nitrogen
mkdir -p ~/Pictures
cp $dotfiles/wall.jpg  $HOME/.config/

# GTK-3.0
 yes | cp -rf $dotfiles/.config/gtk-3.0 $HOME/.config/
 
 
 # packman packages
sudo pacman -S i3 python-i3ipc arandr rofi python-pywal calc jq bc wmctrl geoip dunst libnotify redshift imwheel numlockx unclutter unclutter fzy mediainfo xcolor conky


# yay packages
yay -S picom-ibhagwan-git polybar pacman-contrib cava ttf-indic-otf spotify sptlrx-bin scrot clipit  
 

#i3
yes | cp -rf $dotfiles/.config/i3 $HOME/.config/
yes | cp -rf $dotfiles/.Xresources $HOME/


# picom 
cp $dotfiles/.config/picom.conf $HOME/.config/

# Rofi
yes | cp -rf $dotfiles/.config/rofi $HOME/.config/

# polybar
yes | cp -rf $dotfiles/.config/polybar $HOME/.config/
cd ~/.config/polybar/scripts/
sudo chmod +xwr *.sh

# dunst
yes | cp -rf $dotfiles/.config/dunst $HOME/.config/
cd ~/.config/polybar/scripts/
sudo chmod +xwr *.sh

# scrot
mkdir -p $HOME/screenshots

# imwheel
cp $dotfiles/.imwheelrc  $HOME/

# conky
yes | cp -rf $dotfiles/.config/conky $HOME/.config/

rm -rf ~/tmpInstall
