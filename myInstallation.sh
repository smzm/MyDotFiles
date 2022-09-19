#!/bin/bash

# ================================= DONT USE THIS FILE FOR INSTALLATION 
dotfiles=`echo $PWD`
mkdir -p ~/tmpInstall


sudo pacman -Syu --noconfirm
sudo pacman -S base-devel git wget yajl curl binutils lightdm lightdm-gtk-greeter zsh nodejs npm yarn ruby python rust python-pip jupyter-notebook python-ipykernel pyenv neovim xclip python-pynvim trash-cli lsd tmux aria2 broot ripgrep peco ack lostfiles github-cli tldr kitty zathura mpv xbindkeys xdotool thunar lxappearance xfce4-power-manager xfce4-settings nitrogen viewnior gtk3 ntfs-3g exfat-utils i3 python-i3ipc arandr rofi python-pywal calc jq bc wmctrl geoip dunst libnotify redshift imwheel numlockx unclutter unclutter fzy mediainfo xcolor conky --noconfirm


# YAY
cd ~/tmpInstall
git clone https://aur.archlinux.org/yay.git 
cd yay
makepkg -si

yay --save --nocleanmenu --nodiffmenu


# yay packages
yay -S xbindkeys_config-gtk2 fluent-reader udevil tailwind-css tailwindcss-language-server picom-ibhagwan-git polybar pacman-contrib cava ttf-indic-otf spotify sptlrx-bin scrot clipit nerd-fonts-inconsolata nerd-fonts-fira-code apple-fonts ttf-font-awesome vazirmatn-fonts noto-fonts-emoji


# ZSH config
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

# node config
mkdir ~/.npm
npm config set prefix ~/.npm

# ruby config
echo "gem: --user-install" >> ~/.gemrc
sudo gem update

# PIP, NPM, YARN
pip install numpy pandas scipy sympy matplotlib plotly jedi python-language-server[all]
sudo npm i -g pyright vim-language-server vscode-langservers-extracted typescript typescript-language-server awk-language-server dockerfile-language-server-nodejs emmet-ls bash-language-server
yarn global add yaml-language-server

# NVIM
python3 -m pip install --user --upgrade pynvim
pip3 install pynvim --upgrade
npm install -g neovim
gem install neovim

# VIM-PLUG
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p $HOME/.config/nvim
yes | cp -rf $dotfiles/.config/nvim/* ~/.config/nvim/

# Fonts Config
sudo cp $dotfiles/local.conf /etc/fonts/local.conf
# Install feather font
mkdir -p $HOME/.fonts
yes | cp -rf $dotfiles/.fonts/* $HOME/.fonts/
fc-cache -fv


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


# Disable IPV6
nmcli -t -f NAME,TIMESTAMP con | sort -t: -nk2 | tail -n1 | cut -d: -f1 | xargs -I {} nmcli connection modify {} ipv6.method "disabled"

# comment ipv6 hosts
sed -i 's/^[[:space:]]*::/#::/' /etc/hosts

# Pacman.conf configuration
sudo sed -i -e 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads.*/ParallelDownloads=5/g' /etc/pacman.conf

 whoami | xargs -I {} sudo sed -i '/^\[Seat:\*\]$/,/\[/s/^#autologin-user=.*/autologin-user={}/' /etc/lightdm/lightdm.conf
