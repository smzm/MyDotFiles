#!/bin/bash

dotfiles=`echo $PWD`
mkdir -p ~/tmpInstall


    clear
    echo " ===================== pre installation ====================="
    while ! [[ ( "$ansOS" == "arch" ) || ( "$ansOS" == "deb" ) ]]; do
        echo "For proper installation, type one ? "
        read -p " [arch]    -    [deb]  : " ansOS
    done
        echo 
        read -p " updating and upgrading    :::::    [r]un : " ansUU
        if [[ $ansUU == "r" ]]||[[ $ansUU == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                echo -e "\n +++++ sudo pacman -Syu +++++ \n"
                sudo pacman -Syu

            elif [[ $ansOS == "deb" ]];then
                echo -e "\n +++++ sudo apt-get upgrade +++++ \n +++++ sudo apt-get update +++++ \n"
                sudo apt-get upgrade
                sudo apt-get update

               echo -e "\n +++++ sudo apt-get install -y build-essential +++++ \n"
                sudo apt-get install -y build-essential
            fi
        fi
    clear


    if [[ $ansOS == "arch" ]]; then
            echo " ===================== pre installation ====================="
            echo -e " updating and upgrading "
            read -p " install yaourt and yay    :::::    [r]un : " ansYay
            if [[ $ansYay == "r" ]] || [[ $ansYay == "R" ]]; then
                echo -e "\n +++++ sudo pacman -S binutils +++++ \n"
                sudo pacman -S binutils

                echo -e "\n +++++ installing yaourt +++++\n"
                sudo pacman -S --needed base-devel git wget yajl
                cd ~/tmpInstall 
                git clone https://aur.archlinux.org/package-query.git
                cd package-query/
                makepkg -si

                cd ~/tmpInstall
                git clone https://aur.archlinux.org/yaourt.git
                cd yaourt/
                makepkg -si

                echo -e "\n +++++ installing yay-bin +++++ \n"
                yaourt -S yay
            fi
    fi
        clear



 # ZSH configuration
        echo " ===================== ZSH ====================="
        read -p " zsh    :::::    [r]un: " ansZSH
        if [[ $ansZSH == "r" ]] || [[ $ansZSH == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e " \n +++++ sudo pacman -S zsh +++++ \n"
                sudo pacman -S zsh

                echo -e "\n Make zsh default shell \n"
                echo -e " +++++ sudo usermod -s /usr/bin/zsh $(whoami) +++++ \n "
                sudo usermod -s /usr/bin/zsh $(whoami)
                sudo chsh -s $(which zsh)
                read -p " Please reboot system and continue installation in zsh " notImportant

            elif [[ $ansOS == "deb" ]]; then
                echo -e " \n +++++ sudo apt-get install zsh +++++ \n"
                sudo apt-get install -y zsh

                echo -e "\n Make zsh default shell \n"
                echo -e " +++++ sudo usermod -s /usr/bin/zsh $(whoami) +++++ \n "
                sudo usermod -s /usr/bin/zsh $(whoami)
                sudo chsh -s $(which zsh)
                read -p " Please reboot system and continue installation in zsh " notImportant
            fi
        fi
    clear

        echo " ===================== ZSH ====================="
        echo -e " zsh"
        read -p " oh-my-zsh : [https://github.com/robbyrussell/oh-my-zsh]    :::::    [r]un : " ansOMZ
        if [[ $ansOMZ == "r" ]] || [[ $ansOMZ == "R" ]]; then
                echo -e "\n +++++ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" +++++ \n"
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        fi
    clear

        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh"
        read -p " zsh-syntax-highlighting : [https://github.com/zsh-users/zsh-syntax-highlighting]    :::::    r[un] : " ansSyntaxH
        if [[ $ansSyntaxH == "r"  ]] || [[ $ansSyntaxH == "R" ]]; then
            echo -r "\n +++++ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting +++++ \n"
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        fi
    clear

        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh \n zsh-syntax-highlighting"
        read -p " zsh-auto-suggestions : [https://github.com/zsh-users/zsh-autosuggestions]    :::::    r[un] : " ansAutoS
        if [[ $ansAutoS == "r"  ]] || [[ $ansAutoS == "R" ]]; then
            echo -e " \n +++++ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions +++++ \n"
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        fi
    clear


        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh \n zsh-syntax-highlighting \n zsh-auto-suggestions"
        read -p " Copy .zshrc and .zshenv to home directory    :::::    [r]un : " ansZshrc
        if [[ $ansZshrc == "r" ]] || [[ $ansZshrc == "R" ]]; then
            echo "+++++ Copy .zshrc file to home +++++ "
            cp $dotfiles/.zshrc $dotfiles/.zshenv ~
            source ~/.zshrc
            echo -e "\n Restart terminal and continue installation."
            sleep 2
        fi
    clear



        echo " ===================== Brew ====================="
        read -p " brew installation    :::::    [r]un : " ansBrew
        if [[ $ansBrew == "r" ]] || [[ $ansBrew == "R" ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"    
            echo -e "\n +++++ add Homebrew’s location to your $PATH... +++++ \n"
            export PATH="/usr/local/bin:$PATH"
            
            echo -e "\n +++++  run brew update to make sure Homebrew is up to date... +++++ \n"
            brew update

        fi
        clear


        echo " ===================== Brew App ====================="
        echo -e " brew "
        read -p " gcc    :::::    [r]un : " ansGcc
        if [[ $ansGcc == "r" ]] || [[ $ansGcc == "R" ]]; then
                echo -e "\n +++++ brew install gcc +++++ \n"
                    brew install gcc
        fi
    clear

        echo " ===================== Brew App ====================="
        echo -e " brew \n gcc"
        read -p " tldr    :::::    [r]un : " ansTldr
        if [[ $ansTldr == "r" ]] || [[ $ansTldr == "R" ]]; then
                echo -e "\n +++++  brew install tldr +++++ \n"
                    brew install tldr
        fi
    clear


# Vim
        echo " ===================== nvim ====================="
        read -p " nvim    :::::    [r]un : " ansNvim
        if [[ $ansNvim == "r" ]] || [[ $ansNvim == "R" ]]; then
            echo -e "\n +++++ install neovim nightly +++++  \n"
            if [[ $ansOS == "arch" ]];then
                yay -S neovim-nightly
            else
                brew install neovim --HEAD
            fi
        fi
    clear

        echo " ===================== nvim ====================="
        echo " nvim"
        read -p " Vim-plug : [https://github.com/junegunn/vim-plug]   :::::    [r]un : " ansVimPlug
        if [[ $ansVimPlug == "r" ]] || [[ $ansVimPlug == "R" ]]; then
            echo -e "\n +++++ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \n"
                sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

            echo "\n +++++ Copy .nvim file +++++ \n"
            sudo cp -r $dotfiles/.config/nvim ~/.config/

            clear
            echo  -e "\n run (:PlugInstall) in nvim"
            sleep 2
            nvim
            clear
        fi
    clear


        echo " ===================== Development ====================="
        read -p " node(npm)    :::::    [r]un: " ansNode
        if [[ $ansNode == "r" ]] || [[ $ansNode == "R" ]]; then
                echo -e "\n +++++ install node +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S nodejs
                else
                    brew install node
                fi
        fi
    clear
    
        echo " ===================== Development ====================="
        echo -e " node(npm) "
        read -p " ruby(gem)    :::::    [r]un : " ansRuby
        if [[ $ansRuby == "r" ]] || [[ $ansRuby == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e "\n +++++ sudo pacman -S ruby \n"
                sudo pacman -S ruby
                echo "gem: --user-install" >> ~/.gemrc
                #cp $dotfiles/.profile ~/
            elif [[ $ansOS == "deb" ]]; then
                echo -e "\n +++++ sudo apt install ruby-full \n"
                sudo apt install -y ruby-full
            fi
        sudo gem update
        fi
    clear

        echo " ===================== Development ====================="
        echo -e " node(npm) \n ruby(gem) "
        read -p " python3(pip)    :::::    [r]un : " ansPip
        if [[ $ansPip == "r" ]] || [[ $ansPip == "R" ]]; then
                echo -e "\n +++++ install python +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S python
                    sudo pacman -S python-pip
                else
                    brew install python
                    echo -e "\n +++++  \n"
                    brew unlink python && brew link python
                    pip3 install pynvim jedi
                fi
        fi
    clear

        echo " ===================== PIP ====================="
        read -p " [pip] Python Language Server jedi pyenv  :::::    [r]un : " ansPLS
        if [[ $ansPLS == "r" ]] || [[ $ansPLS == "R" ]]; then
            echo -e "\n +++++ pip3 install python-language-server[all] jedi pyenv +++++ \n"
                    pip install jedi pyenv python-language-server[all]

        fi
    clear


        echo " ===================== Terminal ====================="
        read -p " NerdFont(InconsolataLGC)   :::::    [r]un : " ansNFontInconsolata
        if [[ $ansNFontInconsolata == "r" ]] || [[ $ansNFontInconsolata == "R" ]]; then
                echo -e " \n +++++ Install inconsolaLGC Font \n"
                sudo mkdir -p /usr/share/fonts/InconsolataLGC
                sudo wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/InconsolataLGC/Regular/complete/Inconsolata%20LGC%20Nerd%20Font%20Complete.ttf" -P /usr/share/fonts/InconsolataLGC/
                fc-cache -f -v
        fi
    clear

        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) "
        read -p " SF Mono Font  :::::    [r]un : " ansSFNS
        if [[ $ansSFNS == "r" ]] || [[ $ansSFNS == "R" ]]; then
                echo -e " \n +++++ Install SF Mono font \n"
                sudo mkdir -p /usr/share/fonts/SF-Mono/
                cd ~/tmpInstall/
                git clone "https://github.com/Twixes/SF-Mono-Powerline.git"
                cd SF-Mono-Powerline
                sudo cp -r * /usr/share/fonts/SF-Mono/
                fc-cache -f -v
        fi
    clear

        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n SF Mono Font"
        read -p " lsd    :::::    [r]un : " ansLSD
        if [[ $ansLSD == "r" ]] || [[ $ansLSD == "R" ]]; then
                echo -e "\n +++++ install lsd +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S lsd
                else
                    brew install lsd
                fi
        fi
    clear

        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n SF Mono Font \n lsd"
        read -p " lf   :::::    [r]un : " ansLf
        if [[ $ansLf == "r" ]] || [[ $ansLf == "R" ]]; then
            echo -e "\n +++++ install lf +++++ \n"
            if [[ $ansOS == "arch" ]];then
                yay -S lf
            else
                brew install lf
            fi
            echo -e "\n +++++ Copy Config files ... +++++ \n"
            sudo cp -r $dotfiles/.config/lf ~/.config/
        fi
    clear

        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n SF Mono Font \n lsd \n lf "
        read -p " tmux    :::::    [r]un : " ansTmux
        if [[ $ansTmux == "r" ]] || [[ $ansTmux == "R" ]]; then
            echo -e "\n +++++ install tmux +++++ \n"
            if [[ $ansOS == "arch" ]];then
                sudo pacman -S tmux
            else
                brew install tmux
            fi

            read -p " Copy .tmux.conf to Home ?    :::::    [r]un : " ansCopyTmux
            if [[ $ansCopyTmux == "r" ]] || [[ $ansCopyTmux == "R" ]]; then
                echo "\n +++++ Copy .tmux.conf file to home +++++ \n"
                sudo cp $dotfiles/.tmux.conf ~
            fi
        fi
    clear


        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n SF Mono font \n lsd \n lf \n tmux "
        read -p " aria2 (download manager)   :::::    [r]un: " ansAria2
        if [[ $ansAria2 == "r" ]] || [[ $ansAria2 == "R" ]]; then
                echo -e "\n +++++ install aria2 +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S aria2
                else
                    brew install aria2 
                fi
        fi
    clear

        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n SF Mono font \n lsd \n lf \n tmux \n aria2"
        read -p " broot  :::::    [r]un: " ansBroot
        if [[ $ansBroot == "r" ]] || [[ $ansBroot == "R" ]]; then
                echo -e "\n +++++ install broot +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S broot
                else
                    brew install broot               
                fi

                echo -e "\n +++++ copy config files ... +++++ \n"
                sleep 2
                sudo cp -r $dotfiles/.config/broot ~/.config/
        fi
    clear


        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n SF Mono font \n lsd \n lf \n tmux \n aria2 \n broot"
        read -p " ctags  :::::    [r]un: " ansCtags
        if [[ $ansCtags == "r" ]] || [[ $ansCtags == "R" ]]; then
                echo -e "\n +++++ install ctags +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S ctags
                else
                    brew install ctags
                fi
        fi
    clear

        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n SF Mono font \n lsd \n lf \n tmux \n aria2 \n broot \n ctags"
        read -p " ack  :::::    [r]un: " ansAck
        if [[ $ansAck == "r" ]] || [[ $ansAck == "R" ]]; then
                echo -e "\n +++++ install ack +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S ack
                else
                    brew install ack
                fi
        fi
    clear


        echo " ===================== CheatSheet ====================="
        read -p " CheatSheet    :::::    [r]un : " ansCheatSheet
        if [[ $ansCheatSheet == "r" ]] || [[ $ansCheatSheet == "R" ]]; then
            echo -e "\n +++++ copy /bin to home +++++"
            cp -r $dotfiles/bin ~
        fi
    clear


     if [[ $ansOS == "arch" ]];then
        echo " ===================== GUI APP ====================="
        read -p " alacritty    :::::    [r]un : " ansAlacritty
        if [[ $ansAlacritty == "r" ]] || [[ $ansAlacritty == "R" ]]; then
            echo -e "\n +++++ install alacritty +++++ \n"
                    sudo pacman -S alacritty
            echo -e "\n +++++ copy /alacritty to ~/.config/ +++++"
                    sudo cp -r $dotfiles/.config/alacritty ~/.config/
                    sleep 3
        fi
    clear


        echo " ===================== GUI APP ====================="
        echo -e " alacritty"
        read -p " Brave    :::::    [r]un : " ansBrave
        if [[ $ansBrave == "r" ]] || [[ $ansBrave == "R" ]]; then
            echo -e "\n +++++ install Brave +++++ \n"
                    yay -S brave
        fi
    clear


        echo " ===================== GUI APP ====================="
        echo -e " alacritty \n Brave"
        read -p " MPlayer    :::::    [r]un : " ansMplayer
        if [[ $ansMplayer == "r" ]] || [[ $ansMplayer == "R" ]]; then
            echo -e "\n +++++ install MPlayer +++++ \n"
                    sudo pacman -S mplayer
            echo -e "\n copy input.conf file to the ~/.mplayer"
                    sudo cp -r $dotfiles/.mplayer/input.conf ~/.mplayer/
                    sleep 3
        fi
    clear
    fi

rm -rf ~/tmpInstall

clear



while ! [[ ( "$ansI3" == "y" ) || ( "$ansI3" == "n" ) ]]; do
    read -p "do you want i3wm packages installation : [y]es - [n]o : " ansI3
    clear
done

    if [[ $ansI3 == "y" ]]; then

        echo " ===================== i3 installation ====================="
        read -p " [pip] i3ipc (needed for polybar)    :::::    [r]un : " ansI3ipc
        if [[ $ansI3ipc == "r" ]] || [[ $ansI3ipc == "R" ]]; then
            echo -e "\n +++++ sudo pip install i3ipc \n"
            sudo pip install i3ipc
        fi
    clear

        ECHO " ===================== i3 installation ====================="
        echo -e " i3ipc"
        read -p " Feh (wallpaper)    :::::    [r]un : " ansFeh
        if [[ $ansFeh == "r" ]] || [[ $ansFeh == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S feh \n"
            sudo pacman -S feh
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh"
        read -p " arandr (monitor configuration)    :::::    [r]un : " ansArandr
        if [[ $ansArandr == "r" ]] || [[ $ansArandr == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S arandr \n"
            sudo pacman -S arandr
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr"
        read -p " thunar (file manager)    :::::    [r]un : " ansThunar
        if [[ $ansThunar == "r" ]] || [[ $ansThunar == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S thunar \n"
            sudo pacman -S thunar
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar"
        read -p " rofi (launcher)    :::::    [r]un : " ansRofi
        if [[ $ansRofi == "r" ]] || [[ $ansRofi == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S rofi \n"
            sudo pacman -S rofi

            echo -e " \n +++++ Copy polybar configuration "
            cp -r $dotfiles/.config/rofi $HOME/.config/
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi"
        read -p " picom (compositor)    :::::   [r]un : " ansPicom
        if [[ $ansPicom == "r" ]] || [[ $ansPicom == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S picom \n"
            sudo pacman -S picom
            cp $dotfiles/.config/picom.conf $HOME/.config/
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom"
        read -p " lxappearance    :::::   [r]un : " ansLxappearance
        if [[ $ansLxappearance == "r" ]] || [[ $ansLxappearance == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S lxappearance \n"
            sudo pacman -S lxappearance
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance"
        read -p " pavuControl    :::::    [r]un : " ansPavucontrol
        if [[ $ansPavucontrol == "r" ]] || [[ $ansPacucontrol == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S pavucontrol \n"
            sudo pacman -S pavucontrol
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl"
        read -p " Font Awesome    :::::    [r]un : " ansFontawesome
        if [[ $ansFontawesome == "r" ]] || [[ $ansFontawesome == "R" ]]; then
            echo -e "\n +++++ yay -S ttf-font-awesome \n"
            yay -S ttf-font-awesome
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome"
        read -p " polybar    :::::    [r]un : " ansPolybar
        if [[ $ansPolybar == "r" ]] || [[ $ansPolybar == "R" ]]; then
            echo -e "\n +++++ yay -S polybar \n"
           yay -S polybar

            #copy files
            echo -e " \n +++++ Copy polybar configuration "
            cp -r $dotfiles/.config/polybar $HOME/.config/

        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar"
        read -p " i3lock-fancy    :::::    [r]un : " ansI3lockFancy
        if [[ $ansI3lockFancy == "r" ]] || [[ $ansI3lockFancy == "R" ]]; then
            echo -e "\n +++++ yay -S i3lock-fancy-git \n"
            yay -S i3lock-fancy-git
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy"
        read -p " redshift    :::::    [r]un : " ansRedshift
        if [[ $ansRedshift == "r" ]] || [[ $ansRedshift == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S redshift \n"
            sudo pacman -S redshift
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift"
        read -p " udevil    :::::    [r]un : " ansUdevil
        if [[ $ansUdevil == "r" ]] || [[ $ansUdevil == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S udevil \n"
            sudo pacman -S udevil
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil"
        read -p " scrot (screenshot)   :::::    [r]un : " ansScrot
        if [[ $ansScrot == "r" ]] || [[ $ansScrot == "R" ]]; then
            echo -e "\n +++++ yay -S scrot \n"
            mkdir -p $HOME/screenshots
            yay -S scrot
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot"
        read -p " xclip (clipboard)   :::::    [r]un : " ansXclip
        if [[ $ansXclip == "r" ]] || [[ $ansXclip == "R" ]]; then
            echo -e "\n +++++ yay -S xclip \n"
            yay -S xclip
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip"
        read -p " Background Picture   :::::    [r]un : " ansBackground
        if [[ $ansBackground == "r" ]] || [[ $ansBackground == "R" ]]; then
            echo -e "\n +++++ copy Background file to Picture ... \n"
            cd ~
            mkdir -p Pictures
            cp $dotfiles/wall.jpg  $HOME/.config/
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture"
        read -p " Gnome Calculator    :::::    [r]un : " ansGnomeCalc
        if [[ $ansGnomeCalc == "r" ]] || [[ $ansGnomeCalc == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S gnome-calculator  \n"
            sudo pacman -S gnome-calculator
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator"
        read -p " xfce4 Manager    :::::    [r]un : " ansXfce4Manager
        if [[ $ansXfce4Manager == "r" ]] || [[ $ansXfce4Manager == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S xfce4-power-manager  \n +++++ sudo pacman -S xfce4-settings"
            sudo pacman -S xfce4-power-manager
            sudo pacman -S xfce4-settings
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager"
        read -p " xautolock   :::::    [r]un : " ansXautolock
        if [[ $ansXautolock == "r" ]] || [[ $ansXautolock == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S xautolock \n"
            sudo pacman -S xautolock
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock"
        read -p " hibernator   :::::    [r]un : " ansHibernator
        if [[ $ansHibernator == "r" ]] || [[ $ansHibernator == "R" ]]; then
            echo -e "\n +++++ yay -S hibernator \n"
            yay -S hibernator
            sudo hibernator
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator"
        read -p " clipit   :::::    [r]un : " ansClipit
        if [[ $ansClipit == "r" ]] || [[ $ansClipit == "R" ]]; then
            echo -e "\n +++++ yay -S clipit \n"
            yay -S clipit
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit"
        read -p " ntp (time)  :::::    [r]un : " ansNTP
        if [[ $ansNTP == "r" ]] || [[ $ansNTP == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S ntp \n"
            sudo pacman -S ntp
            sudo systemctl enable ntpd.service
            sudo systemctl start ntpd.service
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp"
        read -p " mediainfo (audio and video information)  :::::    [r]un : " ansMediainfo
        if [[ $ansMediainfo == "r" ]] || [[ $ansMediainfo == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S mediainfo \n"
            sudo pacman -S mediainfo
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo"
        read -p " unclutter (hides an inactive mouse)   :::::    [r]un : " ansUnclutter
        if [[ $ansUnclutter == "r" ]] || [[ $ansUnclutter == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S unclutter ... \n"
            sudo pacman -S unclutter
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo \n unclutter"
        read -p " ntfs-3g (allows accessing NTFS partitions)    :::::    [r]un : " ansNtfs3g
        if [[ $ansNtfs3g == "r" ]] || [[ $ansNtfs3g == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S ntfs-3g ... \n"
            sudo pacman -S ntfs-3g
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo \n unclutter \n ntfs-3g"
        read -p " exfat-utils (allows management of FAT drives)    :::::    [r]un : " ansExfat
        if [[ $ansExfat == "r" ]] || [[ $ansExfat == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S exfat-utils ... \n"
            sudo pacman -S exfat-utils
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo \n unclutter \n ntfs-3g \n exfat-utils"
        read -p " sxiv    :::::    [r]un : " ansSxiv
        if [[ $ansSxiv == "r" ]] || [[ $ansSxiv == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S sxiv ... \n"
            sudo pacman -S sxiv
    fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo \n unclutter \n ntfs-3g \n exfat-utils \n sxiv"
        read -p " numlockx    :::::    [r]un : " ansNumlockx
        if [[ $ansNumlockx == "r" ]] || [[ $ansNumlockx == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S systemd-numlockontty ... \n"
            sudo pacman -S numlockx
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo \n unclutter \n ntfs-3g \n exfat-utils \n sxiv \n numlockx"
        read -p " okular (PDF)    :::::    [r]un : " ansOkular
        if [[ $ansOkular == "r" ]] || [[ $ansOkular == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S okular ... \n"
            sudo pacman -S okular
        fi
    clear
    
         echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo \n unclutter \n ntfs-3g \n exfat-utils \n sxiv \n numlockx \n okular"
        read -p " hsetroot    :::::    [r]un : " ansHsetroot
        if [[ $ansHsetroot == "r" ]] || [[ $ansHsetroot == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S hsetroot ... \n"
            sudo pacman -S hsetroot
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n picom \n lxappearance \n pavuControl \n Font Awesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture \n Gnome Calculator \n xfce4 Manager \n xautolock \n hibernator \n clipit \n ntp \n mediainfo \n unclutter \n ntfs-3g \n exfat-utils \n sxiv \n numlockx \n okular \n hsetroot"
        read -p " i3wm config file copy    :::::    [r]un : " ansI3Config
        if [[ $ansI3Config == "r" ]] || [[ $ansI3Config == "R" ]]; then
            echo -e "\n +++++ copy i3wm configuration file ... \n"
            cp -r $dotfiles/.config/i3  $HOME/.config/
        fi
    clear
fi
