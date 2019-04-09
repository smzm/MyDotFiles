#!/bin/bash

dotfiles=`echo $PWD`
mkdir -p ~/tmpInstall

while ! [[ ( "$ansOS" == "arch" ) || ( "$ansOS" == "deb" ) ]]; do
    echo "For proper installation, type one ? "
    read -p " [arch]    -    [deb]  : " ansOS 
done

    clear
    echo " ===================== pre installation ====================="
        read -p " updating and upgrading    :::::    r[un] : " ansUU
        if [[ $ansUU == "r" ]]||[[ $ansUU == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                echo -e "\n +++++ sudo pacman -Syu \n"
                sudo pacman -Syu

            elif [[ $ansOS == "deb" ]];then 
                echo -e "\n +++++ sudo apt-get update \n +++++ sudo apt-get upgrade \n"
                sudo apt-get update 
                sudo apt-get upgrade

                echo -e "\n sudo apt-get install -y build-essential \n"
                sudo apt-get install -y build-essential

            fi
        fi
    clear

        echo " ===================== pre installation ====================="
        echo -e " updating and upgrading "
        read -p " git    :::::    [r]un : " ansGit
        if [[ $ansGit == "r" ]] || [[ $ansGit == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                echo -e "\n +++++ sudo pacman -S git \n"
                sudo pacman -S git

            elif [[ $ansOS == "deb" ]]; then
                echo -e "\n +++++ sudo apt-get install -y git \n"
                sudo apt-get install -y git
            fi
        fi

    clear

        echo " ===================== pre installation ====================="
        echo -e " updating and upgrading \n git"
        read -p " curl    :::::    [r]un : " ansCurl
        if [[ $ansCurl == "r" ]] || [[ $ansCurl == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e "\n +++++ sudo pacman -S curl \n"
                sudo pacman -S curl 
            elif [[ $ansOS == "deb" ]];then
                echo -e "\n +++++ sudo apt-get install -y curl \n"
                sudo apt-get install -y curl
            fi
        fi

    clear

        echo " ===================== pre installation ====================="
        echo -e " updating and upgrading \n git \n curl"
        read -p " cmake    :::::    [r]un : " ansCmake
        if [[ $ansCmake == "r" ]] || [[ $ansCmake == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                echo -e "\n +++++ sudo pacman -S cmake \n"
                sudo pacman -S cmake
            elif [[ $ansOS == "deb" ]];then
                echo -e "\n +++++ sudo apt-get install cmake \n"
                sudo apt-get install -y cmake
            fi
        fi
    clear


        echo " ===================== pre installation ====================="
        echo -e " updating and upgrading \n git \n curl \n cmake"
        read -p " dnsutils    :::::    [r]un : " ansDnsutils
        if [[ $ansDnsutils == "r" ]] || [[ $ansDnsutils == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                echo -e "\n +++++ sudo pacman -S dnsutils \n"
                sudo pacman -S dnsutils 
            elif [[ $ansOS == "deb" ]];then
                echo -e "\n +++++ sudo apt-get install dnsutils \n"
                sudo apt-get install -y dnsutils
            fi
            echo -e "\n you can change dns address in resolv.conf and then run \n sudo chattr +i resolv.conf "
            sleep 2
        fi
    clear

if [[ $ansOS == "arch" ]]; then
        echo " ===================== pre installation ====================="
        echo -e " updating and upgrading \n git \n curl \n cmake \n dnsutils"
        read -p " yay    :::::    [r]un : " ansYay
        if [[ $ansYay == "r" ]] || [[ $ansYay == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S binutils \n"
            sudo pacman -S binutils

            echo -e "\n +++++ installing yay \n"
            cd ~/tmpInstall
            git clone https://aur.archlinux.org/yay-bin.git
            cd yay-bin
            makepkg -sri
        fi
fi


    clear
    # ZSH configuration
        echo " ===================== ZSH ====================="
        read -p " zsh installation    :::::    [r]un: " ansZSH
        if [[ $ansZSH == "r" ]] || [[ $ansZSH == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e " \n +++++ sudo pacman -S zsh \n"
                sudo pacman -S zsh

                echo -e "\n Make zsh default shell \n"
                echo -e " +++++ sudo usermod -s /usr/bin/zsh $(whoami) \n "
                sudo usermod -s /usr/bin/zsh $(whoami)
                sudo chsh -s $(which zsh)
                read -p " Please reboot system and continue installation in zsh " notImportant

            elif [[ $ansOS == "deb" ]]; then
                echo -e " \n +++++ sudo apt-get install zsh \n"
                sudo apt-get install -y zsh

                echo -e "\n Make zsh default shell \n"
                echo -e " +++++ sudo usermod -s /usr/bin/zsh $(whoami) \n "
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
                echo -e "\n +++++ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \n"
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        fi
    clear

        

        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh"
        read -p " zsh-syntax-highlighting : [https://github.com/zsh-users/zsh-syntax-highlighting]    :::::    r[un] : " ansSyntaxH
        if [[ $ansSyntaxH == "r"  ]] || [[ $ansSyntaxH == "R" ]]; then 
            echo -r "\n +++++ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \n"
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        fi
    clear

        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh \n syntax-highlighting"
        read -p " zsh-autosuggestions : [https://github.com/zsh-users/zsh-autosuggestions]    :::::    r[un] : " ansAutoS
        if [[ $ansAutoS == "r"  ]] || [[ $ansAutoS == "R" ]]; then 
            echo -e " \n +++++ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \n"
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        fi

    clear
        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh \n syntax-highlighting \n auto-suggestions"
        read -p " Copy .zshrc to home directory    :::::    r[un] : " ansZshrc
        if [[ $ansZshrc == "r" ]] || [[ $ansZshrc == "R" ]]; then
            echo "+++++ Copy .zshrc file to home"
            cp $dotfiles/.zshrc ~
            source ~/.zshrc

            echo -e "\n Restart terminal and continue installation."
        fi

    clear





        echo " ===================== Nodejs(npm)  Ruby(gem)  Python(pip) ====================="
        read -p " node(npm) installation    :::::    [r]un: " ansNode
        if [[ $ansNode == "r" ]] || [[ $ansNode == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e "\n sudo pacman -S nodejs npm \n"
                sudo pacman -S nodejs
                sudo pacman -S npm
            elif [[ $ansOS == "deb" ]]; then
                echo -e "\n +++++ Add node to repository and install \n"
                cd ~ 
                curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
                sudo apt install -y nodejs
            fi

            echo "\n +++++ Some changes for installing npm packages without sudo ... \n"
            mkdir -p ~/.npm
            sudo chown -R $(whoami) ~/.npm
            npm config set prefix ~/.npm
        fi

    clear

        echo " ===================== Nodejs(npm)  Ruby(gem)  Python(pip) ====================="
        echo -e " node "
        read -p " ruby(gem) installation    :::::    [r]un : " ansRuby
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


        echo " ===================== Nodejs(npm)  Ruby(gem)  Python(pip) ====================="
        echo -e " node \n ruby "
        read -p " pip installation    :::::    [r]un : " ansPip
        if [[ $ansPip == "r" ]] || [[ $ansPip == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                echo -e "\n +++++ sudo pacman -S python-pip \n"
                sudo pacman -S python-pip
            elif [[ $ansOS == "deb" ]]; then
                echo -e "\n +++++ sudo apt-get install python3-pip \n"
                sudo apt install python3-pip
            fi
        fi
    clear


        echo " ===================== npm , pip , gem  packages ====================="
        read -p " [npm] sass    :::::    [r]un : " ansSass
        if [[ $ansSass == "r" ]] || [[ $ansSass == "R" ]]; then
            echo -e "\n +++++ npm install -g sass \n"
            npm install -g sass
        fi
    clear

        echo " ===================== npm , pip , gem  packages ====================="
        echo -e " sass"
        read -p " [npm] browser-sync    :::::    [r]un : " ansBrowserSync
        if [[ $ansBrowserSync == "r" ]] || [[ $ansBrowserSync == "R" ]]; then
            echo -e "\n +++++ npm install -g browser-sync \n"
            npm install -g browser-sync
        fi
    clear

        echo " ===================== npm , pip , gem  packages ====================="
        echo -e " sass \n browser-sync"
        read -p " [npm] nodemon    :::::    [r]un : " ansNodemon
        if [[ $ansNodemon == "r" ]] || [[ $ansNodemon == "R" ]]; then
            echo -e "\n +++++ npm install -g nodemon \n"
            npm install -g nodemon
        fi
    clear



        echo " ===================== Terminal ====================="
        read -p " NerdFont(InconsolataLGC) : https://nerdfonts.com   :::::    [r]un : " ansNFontInconsolata
        if [[ $ansNFontInconsolata == "r" ]] || [[ $ansNFontInconsolata == "R" ]]; then
                echo -e " \n +++++ Install inconsolaLGC Font \n"
                sudo mkdir -p /usr/share/fonts/InconsolataLGC

                cd ~/tmpInstall
                wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/InconsolataLGC.zip"
                sudo unzip InconsolataLGC.zip -d /usr/share/fonts/InconsolataLGC
                sudo rm -rf /usr/share/fonts/InconsolataLGC/*Windwos*.ttf
                fc-cache -f -v
        fi 
    clear


        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) "
        read -p " NerdFont(Lekton) : https://nerdfonts.com   :::::    [r]un : " ansNFontLekton
        if [[ $ansNFontLekton == "r" ]] || [[ $ansNFontLekton == "R" ]]; then
                echo -e " \n +++++ Install Lekton Font \n"
                sudo mkdir -p /usr/share/fonts/Lekton
                cd ~/tmpInstall
                wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Lekton.zip"
                sudo unzip Lekton.zip -d /usr/share/fonts/Lekton
                sudo rm -rf /usr/share/fonts/Lekton/*Windwos*.ttf
                fc-cache -f -v
        fi
    clear


        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n NerdFont(Lekton) "
        read -p " Yosemite San Francisco Font : (https://github.com/supermarin/YosemiteSanFranciscoFont)  :::::    [r]un : " ansSFNS
        if [[ $ansSFNS == "r" ]] || [[ $ansSFNS == "R" ]]; then
                echo -e " \n +++++ Install San Francisco Font \n"
                sudo mkdir -p /usr/share/fonts/SFNSDisplay
                cd ~/tmpInstall
                git clone "https://github.com/supermarin/YosemiteSanFranciscoFont.git"
                cd YosemiteSanFranciscoFont
                sudo cp ./*.ttf /usr/share/fonts/SFNSDisplay
                fc-cache -f -v
        fi
    clear


        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n NerdFont(Lekton) \n Yosemite San Francisco Display"
        read -p " lsd    :::::    [r]un : " ansLSD
        if [[ $ansLSD == "r" ]] || [[ $ansLSD == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e "\n +++++ sudo pacman -S lsd \n"
                sudo pacman -S lsd
            elif [[ $ansOS == "deb" ]]; then
                echo -e "\n +++++ sudo snap install lsd --classic \n"
                sudo snap install lsd --classic
            fi
        fi
    clear

        echo " ===================== Terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n NerdFont(Lekton) \n Yosemite San Francisco Display \n lsd"
        read -p " vifm   :::::    [r]un : " ansVifm
        if [[ $ansVifm == "r" ]] || [[ $ansVifm == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e "\n +++++ sudo pacman -S vifm \n"
                sudo pacman -S vifm
            elif [[ $ansOS == "deb" ]]; then
                echo -e "\n +++++ sudo apt install -y vifm \n"
                sudo apt install -y vifm
            fi
        fi
    clear



    echo " ===================== Terminal ====================="
    echo -e " NerdFont(InconsolataLGC) \n NerdFont(Lekton) \n Yosemite San Francisco Display \n lsd \n vifm "
    read -p " tmux    :::::    [r]un : " ansTmux
    if [[ $ansTmux == "r" ]] || [[ $ansTmux == "R" ]]; then
        if [[ $ansOS == "arch" ]]; then
            echo -e "\n +++++ sudo pacman -S install tmux  \n"
            sudo pacman -S tmux
        elif [[ $ansOS == "deb" ]];then 
            echo -e "\n +++++ sudo apt-get install tmux  \n"
            sudo apt-get install -y tmux
        fi
           
        read -p " Copy .tmux.conf to Home ?    :::::    [r]un : " ansCopyTmux
        if [[ $ansCopyTmux == "r" ]] || [[ $ansCopyTmux == "R" ]]; then
            echo "\n +++++ Copy .tmux.conf file to home \n"
            sudo cp $dotfiles/.tmux.conf ~
        fi
    fi
clear



        echo " ===================== terminal ====================="
        echo -e " NerdFont(InconsolataLGC) \n NerdFont(Lekton) \n Yosemite San Francisco Display \n lsd \n vifm \n tmux"
        read -p " TLDR installation : [https://github.com/tldr-pages/tldr]   :::::    [r]un: " ansTLDR
        if [[ $ansTLDR == "r" ]] || [[ $ansTLDR == "R" ]]; then
            echo -e "\n +++++ tldr installation \n"
            mkdir -p ~/bin
            curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
            chmod +x ~/bin/tldr
        fi
    clear


# Vim 
        echo " ===================== vim ====================="
        read -p " vim    :::::    [r]un : " ansVim
        if [[ $ansVim == "r" ]] || [[ $ansVim == "R" ]]; then
        if [[ $ansOS == "arch" ]]; then
            echo -e "\n +++++ sudo pacman -S install gvim  \n"
            sudo pacman -S vim
        elif [[ $ansOS == "deb" ]];then 
            echo -e "\n +++++ sudo apt-get install tmux  \n"
            sudo apt-get install -y vim
        fi

    fi
    clear

        echo " ===================== vim ====================="
        echo " vim"
        read -p " Vim-plug : [https://github.com/junegunn/vim-plug]   :::::    [r]un : " ansVimPlug
        if [[ $ansVimPlug == "r" ]] || [[ $ansVimPlug == "R" ]]; then
            echo -e "\n +++++ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \n"
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim    
            
            echo "\n +++++ Copy .vimrc file to home \n"
            sudo cp $dotfiles/.vimrc ~

            clear
            echo  -e "\n run (:PlugInstall) in vim"
            sleep 2
            vim
        fi
    clear


        echo " ===================== tweak (just for gnome) ====================="
        read -p " gnome-tweak    :::::    [r]un : " ansTweak
        if [[ $ansTweak == "r" ]] || [[ $ansTweak == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                echo -e "\n +++++ sudo apt-get install gnome-tweak-tool \n +++++ sudo add-apt-repository ppa:webupd8team/gnome3 \n +++++ sudo apt-get update  \n +++++ apt-get install gnome-shell-extensions \n +++++ firefox https://extensions.gnome.org/extension/19/user-themes/ \n"       
                sudo pacman -S gnome-tweaks
                sudo pacman -S chrome-gnome-shell
            elif [[ $ansOS == "deb" ]];then 
                echo -e "\n +++++ sudo apt-get install gnome-tweak-tool \n +++++ sudo add-apt-repository ppa:webupd8team/gnome3 \n +++++ sudo apt-get update  \n +++++ apt-get install gnome-shell-extensions \n +++++ firefox https://extensions.gnome.org/extension/19/user-themes/ \n"       
                sudo apt-get install gnome-tweak-tool
                sudo add-apt-repository ppa:webupd8team/gnome3
                sudo apt-get update 
                apt-get install gnome-shell-extensions
                sudo apt-get install chrome-gnome-shell
                firefox "https://extensions.gnome.org/extension/19/user-themes/"
            fi
        fi
    clear

        echo " ===================== CheatSheet ====================="
        read -p " CheatSheet    :::::    [r]un : " ansCheatSheet
        if [[ $ansCheatSheet == "r" ]] || [[ $ansCheatSheet == "R" ]]; then
            echo -e "\n +++++ copy /bin to home"
            cp -r $dotfiles/bin ~
        fi
    clear

rm -rf ~/tmpInstall 



        echo " ===================== app ====================="
        read -p " vscode    :::::   [r]un : " ansVscode
        if [[ $ansVscode == "r"  ]] || [[ $ansVscode == "R" ]]; then   
            if [[ $ansOS == "arch" ]];then 
                sudo pacman -S code
            elif [[ $ansOS == "deb" ]];then
                sudo snap install vscode --classic
            fi
        fi
        
        read -p " vscode extensions   :::::   [r]un : " ansVscodeExt
        if [[ $ansVscodeExt == "r"  ]] || [[ $ansVscodeExt == "R" ]]; then   
            echo -e "\n +++++ Installing extensions \n"
            code --install-extension abusaidm.html-snippets
            code --install-extension adelphes.google-search-ext
            code --install-extension christian-kohler.npm-intellisense
            code --install-extension Compulim.compulim-vscode-dictionary
            code --install-extension dbaeumer.vscode-eslint
            code --install-extension DigitalBrainstem.javascript-ejs-support
            code --install-extension ecmel.vscode-html-css
            code --install-extension eg2.vscode-npm-script
            code --install-extension esbenp.prettier-vscode
            code --install-extension fisheva.eva-theme
            code --install-extension kyleerickson.night-rider
            code --install-extension leizongmin.node-module-intellisense
            code --install-extension lihui.vs-color-picker
            code --install-extension mgmcdermott.vscode-language-babel
            code --install-extension mrmlnc.vscode-scss
            code --install-extension ms-python.python
            code --install-extension ms-vscode.vscode-typescript-tslint-plugin
            code --install-extension naumovs.color-highlight
            code --install-extension PKief.material-icon-theme
            code --install-extension remimarsal.prettier-now
            code --install-extension ritwickdey.live-sass
            code --install-extension ritwickdey.LiveServer
            code --install-extension robinbentley.sass-indented
            code --install-extension shyykoserhiy.vscode-spotify
            code --install-extension vscodevim.vim
            code --install-extension yummygum.city-lights-theme
        fi


        read -p " vscode configurations    :::::   [r]un : " ansVscodeConfig
        if [[ $ansVscodeConfig == "r"  ]] || [[ $ansVscodeConfig == "R" ]]; then
            echo -e "\n +++++ Copy setting file \n"
            cp $dotfiles/vscode/settings.json $HOME/.config/Code*/User/
            cp $dotfiles/vscode/keybindings.json $HOME/.config/Code*/User/
            
            mkdir -p $HOME/.config/Code*/User/snippets
            cp -r $dotfiles/vscode/snippets/ $HOME/.config/Code*/User/snippets/
        fi
        
        echo
        read -p " VLC    :::::   [r]un : " ansVLC
        if [[ $ansVLC == "r"  ]] || [[ $ansVLC == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                sudo pacman -S vlc
            elif [[ $ansOS == "deb" ]];then
                sudo snap install vlc
            fi
        fi

        echo
        read -p " Spotify    :::::   [r]un : " ansSpotify
        if [[ $ansSpotify == "r"  ]] || [[ $ansSpotify == "R" ]]; then
            if [[ $ansOS == "arch" ]];then
                yay -S spotify 
            elif [[ $ansOS == "deb" ]];then
                sudo snap install spotify
            fi
        fi

        if [[ $ansOS == "arch" ]]; then
            echo
            read -p " Hyper    :::::    [r]un : " ansHyper
            if [[ $ansHyper == "r" ]] || [[ $ansHyper == "R" ]]; then
                yay -S hyper

                echo -e "copy configuration file"
                cp $dotfiles/.hyper.js $HOME/
            fi

            echo 
            read -p " Google-chrome    :::::    [r]un : " ansGoogleChrome
            if [[ $ansGoogleChrome == "r" ]] || [[ $ansGoogleChrome == "R" ]]; then
                yay -S google-chrome
            fi
        fi
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

        echo " ===================== i3 installation ====================="
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
        read -p " compton (compositor)    :::::   [r]un : " ansCompton
        if [[ $ansCompton == "r" ]] || [[ $ansCompton == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S compton \n"
            sudo pacman -S compton
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton"
        read -p " lxappearance    :::::   [r]un : " ansLxappearance
        if [[ $ansLxappearance == "r" ]] || [[ $ansLxappearance == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S lxappearance \n"
            sudo pacman -S lxappearance
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance"
        read -p " pavuControl    :::::    [r]un : " ansPavucontrol
        if [[ $ansPavucontrol == "r" ]] || [[ $ansPacucontrol == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S pavucontrol \n"
            sudo pacman -S pavucontrol
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl"
        read -p " Font Awesome    :::::    [r]un : " ansFontawesome
        if [[ $ansFontawesome == "r" ]] || [[ $ansFontawesome == "R" ]]; then
            echo -e "\n +++++ yay -S ttf-font-awesome \n"
            yay -S ttf-font-awesome
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n Font Awesome"
        read -p " polybar    :::::    [r]un : " ansPolybar
        if [[ $ansPolybar == "r" ]] || [[ $ansPolybar == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S polybar \n"
            sudo pacman -S polybar

            #copy files
            echo -e " \n +++++ Copy polybar configuration "
            cp -r $dotfiles/.config/polybar $HOME/.config/

        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n FontAwesome \n polybar"
        read -p " i3lock-fancy    :::::    [r]un : " ansI3lockFancy
        if [[ $ansI3lockFancy == "r" ]] || [[ $ansI3lockFancy == "R" ]]; then
            echo -e "\n +++++ sudo yay -S i3lock-fancy-git \n"
            yay -S i3lock-fancy-git
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n FontAwesome \n polybar \n i3lock-fancy"
        read -p " redshift    :::::    [r]un : " ansRedshift
        if [[ $ansRedshift == "r" ]] || [[ $ansRedshift == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S redshift \n"
            sudo pacman -S redshift
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n FontAwesome \n polybar \n i3lock-fancy \n redshift"
        read -p " udevil    :::::    [r]un : " ansUdevil
        if [[ $ansUdevil == "r" ]] || [[ $ansUdevil == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S udevil \n"
            sudo pacman -S udevil
        fi
    clear

        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n FontAwesome \n polybar \n i3lock-fancy \n redshift \n udevil"
        read -p " scrot (screenshot)   :::::    [r]un : " ansScrot
        if [[ $ansScrot == "r" ]] || [[ $ansScrot == "R" ]]; then
            echo -e "\n +++++ yay -S scrot \n"
            mkdir screenshots
            yay -S scrot
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n FontAwesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot"
        read -p " xclip (clipboard)   :::::    [r]un : " ansXclip
        if [[ $ansXclip == "r" ]] || [[ $ansXclip == "R" ]]; then
            echo -e "\n +++++ yay -S xclip \n"
            yay -S xclip
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n FontAwesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip"
        read -p " Background    :::::    [r]un : " ansBackground
        if [[ $ansBackground == "r" ]] || [[ $ansBackground == "R" ]]; then
            echo -e "\n +++++ copy Background file to Picture ... \n"
            cp $dotfiles/Background.jpg  $HOME/Pictures/
        fi
    clear


        echo " ===================== i3 installation ====================="
        echo -e " i3ipc \n Feh \n arandr \n thunar \n rofi \n compton \n lxappearance \n pavuControl \n FontAwesome \n polybar \n i3lock-fancy \n redshift \n udevil \n scrot \n xclip \n Background Picture "
        read -p " i3wm config file copy    :::::    [r]un : " ansI3Config
        if [[ $ansI3Config == "r" ]] || [[ $ansI3Config == "R" ]]; then
            echo -e "\n +++++ copy i3wm configuration file ... \n"
            cp -r $dotfiles/.config/i3  $HOME/.config/
        fi
    clear

fi
