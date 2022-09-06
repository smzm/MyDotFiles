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
    echo -e "\n \n"


    if [[ $ansOS == "arch" ]]; then
            echo " ===================== pre installation ====================="
            echo -e " updating and upgrading "
            read -p " install yaourt and yay    :::::    [r]un : " ansYay
            if [[ $ansYay == "r" ]] || [[ $ansYay == "R" ]]; then
                echo -e "\n +++++ sudo pacman -S binutils +++++ \n"
                sudo pacman -S binutils wget

                echo -e "\n +++++ installing yay +++++ \n"
                cd ~/tmpInstall
                git clone https://aur.archlinux.org/yay.git 
                cd yay
                makepkg -si
                sleep 2

                echo -e "\n +++++ installing yaourt +++++\n"
                sudo pacman -S --needed base-devel git wget yajl
                cd ~/tmpInstall 
                git clone https://aur.archlinux.org/package-query.git
                cd package-query/
                makepkg -si
                sleep 2

                cd ~/tmpInstall
                git clone https://aur.archlinux.org/yaourt.git
                cd yaourt/
                makepkg -si
                sleep 2

            fi
    fi
        echo -e "\n \n"



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
    echo -e "\n \n"
    

        echo " ===================== ZSH ====================="
        echo -e " zsh"
        read -p " oh-my-zsh : [https://github.com/robbyrussell/oh-my-zsh]    :::::    [r]un : " ansOMZ
        if [[ $ansOMZ == "r" ]] || [[ $ansOMZ == "R" ]]; then
                echo -e "\n +++++ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" +++++ \n"
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        fi
    echo -e "\n \n"
    

        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh"
        read -p " zsh-syntax-highlighting : [https://github.com/zsh-users/zsh-syntax-highlighting]    :::::    [r]un : " ansSyntaxH
        if [[ $ansSyntaxH == "r"  ]] || [[ $ansSyntaxH == "R" ]]; then
            echo -r "\n +++++ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting +++++ \n"
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        fi
    echo -e "\n \n"


        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh \n zsh-syntax-highlighting"
        read -p " zsh-auto-suggestions : [https://github.com/zsh-users/zsh-autosuggestions]    :::::    [r]un : " ansAutoS
        if [[ $ansAutoS == "r"  ]] || [[ $ansAutoS == "R" ]]; then
            echo -e " \n +++++ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions +++++ \n"
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        fi
    echo -e "\n \n"


        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh \n zsh-syntax-highlighting \n zsh-auto-suggestions"
        read -p " starship     :::::    r[un] : " ansStarship
        if [[ $ansStarship == "r"  ]] || [[ $ansStarship == "R" ]]; then
            echo -e " \n +++++ curl -sS https://starship.rs/install.sh | sh +++++ \n"
            curl -sS https://starship.rs/install.sh | sh
            
            echo "+++++ Copy starship.toml file to home +++++ "
            cp $dotfiles/.config/starship.toml ~/.config/
            sleep 2
        fi
    echo -e "\n \n"


        echo " ===================== ZSH ====================="
        echo -e " zsh \n oh-my-zsh \n zsh-syntax-highlighting \n zsh-auto-suggestions \n starship"
        read -p " Copy .zshrc and .zshenv to home directory    :::::    [r]un : " ansZshrc
        if [[ $ansZshrc == "r" ]] || [[ $ansZshrc == "R" ]]; then
            echo "+++++ Copy .zshrc file to home +++++ "
            cp $dotfiles/.zshrc $dotfiles/.zshenv ~
            source ~/.zshrc
            echo -e "\n Restart terminal and continue installation."
            sleep 2
        fi
    echo -e "\n \n"



        echo " ===================== Brew ====================="
        read -p " brew installation    :::::    [r]un : " ansBrew
        if [[ $ansBrew == "r" ]] || [[ $ansBrew == "R" ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"    
            echo -e "\n +++++ add Homebrew’s location to your $PATH... +++++ \n"
            export PATH="/usr/local/bin:$PATH"
            
            echo -e "\n +++++  run brew update to make sure Homebrew is up to date... +++++ \n"
            brew update

        fi
        read -p " gcc    :::::    [r]un : " ansGcc
        if [[ $ansGcc == "r" ]] || [[ $ansGcc == "R" ]]; then
                echo -e "\n +++++ brew install gcc +++++ \n"
                    brew install gcc
        fi
        
echo -e "\n \n"

        echo " ===================== Development ====================="
        read -p " node(npm)    :::::    [r]un: " ansNode
        if [[ $ansNode == "r" ]] || [[ $ansNode == "R" ]]; then
                echo -e "\n +++++ install node, npm, yarn +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S nodejs
                    sudo pacman -S npm
                    sudo pacman -S yarn
                else
                    sudo apt-get install nodejs
                    sudo apt-get install npm
                fi
                echo "config npm to install without sudo "
                mkdir ~/.npm
                npm config set prefix ~/.npm

        fi
    echo -e "\n \n"
        read -p " ruby(gem)    :::::    [r]un : " ansRuby
        if [[ $ansRuby == "r" ]] || [[ $ansRuby == "R" ]]; then
            if [[ $ansOS == "arch" ]]; then
                echo -e "\n +++++ install ruby, gem  \n"
                sudo pacman -S ruby
                echo "gem: --user-install" >> ~/.gemrc
                #cp $dotfiles/.profile ~/
            elif [[ $ansOS == "deb" ]]; then
                echo -e "\n +++++ sudo apt install ruby-full \n"
                sudo apt install -y ruby-full
            fi
        sudo gem update
        fi
    echo -e "\n \n"
        read -p " python3(pip)    :::::    [r]un : " ansPip
        if [[ $ansPip == "r" ]] || [[ $ansPip == "R" ]]; then
                echo -e "\n +++++ install python, pip +++++ \n"
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
    echo -e "\n \n"

        echo " ===================== My Development Packages ====================="
        read -p " [pip] : numpy | pandas | scipy | sympy | matplotlib | plotly | jupyter notebook ::::: [r]un : " ansPLS2
        if [[ $ansPLS2 == 'r' ]] || [[ $ansPLS2 == "R" ]]; then
            echo -e "+++++ pip3 install numpy pandas scipy sympy matplotlib plotly"
                pip install numpy pandas scipy sympy matplotlib plotly 
                
                if [[ $ansOS == "arch" ]]; then
                    sudo pacman -S jupyter-notebook python-ipykernel
                else 
                    pip install jupyter
                fi
        fi
        
        
        read -p " [npm][pip] : language-servers |  ::::: [r]un : " ansLS
        if [[ $ansLS == 'r' ]] || [[ $ansLS == "R" ]]; then
            echo -e "+++++ language-servers | "
               sudo npm i -g pyright
               sudo npm i -g vim-language-server
               sudo npm i -g vscode-langservers-extracted
               sudo npm i -g typescript typescript-language-server
               sudo npm i -g awk-language-server
               sudo npm i -g dockerfile-language-server-nodejs
               sudo npm i -g emmet-ls
               
               yarn global add yaml-language-server
               sudo npm install -g bash-language-server
               pip install jedi python-language-server[all]
               
               if [[ $ansOS == "arch" ]]; then
                    yay -S tailwind-css
                    yay -S tailwindcss-language-server
                    sudo pacman -S pyenv
               else 
                    sudo npm i -g @tailwindcss/language-server
                    brew install pyenv
               fi
        fi
    echo -e "\n \n"


# Vim
        echo " ===================== nvim ====================="
        read -p " nvim    :::::    [r]un : " ansNvim
        if [[ $ansNvim == "r" ]] || [[ $ansNvim == "R" ]]; then
            echo -e "\n +++++ install neovim +++++  \n"
            if [[ $ansOS == "arch" ]];then
                sudo pacman -S neovim
                sudo pacman -S python-pynvim 
            else
                brew install neovim
            fi
            
            python3 -m pip install --user --upgrade pynvim
            sudo pip3 install pynvim --upgrade
            npm install -g neovim
            gem install neovim
        fi
    echo -e "\n \n"

        echo " ===================== nvim ====================="
        echo " nvim"
        read -p " Vim-plug : [https://github.com/junegunn/vim-plug]   :::::    [r]un : " ansVimPlug
        if [[ $ansVimPlug == "r" ]] || [[ $ansVimPlug == "R" ]]; then
            echo -e "\n +++++ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \n"
                sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

            echo "\n +++++ Copy .nvim file +++++ \n"
            mkdir -p $HOME/.config/nvim
            yes | cp -rf $dotfiles/.config/nvim/* ~/.config/nvim/

            echo -e "\n \n"
            echo  -e "\n run (:PlugInstall) in nvim"
            sleep 2
            nvim
            echo -e "\n \n"
        fi
    echo -e "\n \n"


         echo " ===================== Fonts ====================="
        read -p " InconsolataLGC Nerd Font  :::::    [r]un : " ansNFontInconsolata
        if [[ $ansNFontInconsolata == "r" ]] || [[ $ansNFontInconsolata == "R" ]]; then
                echo -e " \n +++++ Install inconsolaLGC Font \n"
                sudo mkdir -p /usr/share/fonts/InconsolataLGC
                sudo wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/InconsolataLGC/Regular/complete/Inconsolata%20LGC%20Nerd%20Font%20Complete.ttf" -P /usr/share/fonts/InconsolataLGC/
                fc-cache -f -v
        fi
    echo -e "\n \n"


        if [[ $ansOS == "arch" ]]; then
            echo " ===================== Fonts ====================="
            echo -e " InconsolataLGC Nerd Font "
            read -p " Apple Fonts  :::::    [r]un : " ansApplefonts
            if [[ $ansApplefonts == "r" ]] || [[ $ansApplefonts == "R" ]]; then
                    echo -e " \n +++++ Install Apple fonts : SF Pro | SF Compact | SF Mono | SF Arabic | Newyork \n"
                    yay -S apple-fonts
            fi
            echo -e "\n \n"


            echo " ===================== Fonts ====================="
            echo -e " InconsolataLGC Nerd Font \n Apple Fonts"
            read -p " Font Awesome    :::::    [r]un : " ansFontawesome
            if [[ $ansFontawesome == "r" ]] || [[ $ansFontawesome == "R" ]]; then
                echo -e "\n +++++ yay -S ttf-font-awesome \n"
                yay -S ttf-font-awesome
            fi
            echo -e "\n \n"
        
            echo " ===================== Fonts ====================="
            echo -e " InconsolataLGC Nerd Font \n Apple Fonts \n ttf-font-awesome"
            read -p " VazirMatn   :::::    [r]un : " ansVazir
            if [[ $ansVazir == "r" ]] || [[ $ansVazir == "R" ]]; then
                echo -e "\n +++++ yay -S vazirmatn-fonts \n"
                yay -S vazirmatn-fonts
            fi
            echo -e "\n \n"
        
                    echo " ===================== Fonts ====================="
            echo -e " InconsolataLGC Nerd Font \n Apple Fonts \n ttf-font-awesome \n Vazirmatn"
            read -p " noto font emoji    :::::    [r]un : " ansNotoemoji
            if [[ $ansNotoemoji == "r" ]] || [[ $ansNotoemoji == "R" ]]; then
                echo -e "\n +++++ yay -S noto-fonts-emoji \n"
                yay -S noto-fonts-emoji
            fi
            echo -e "\n \n"
    fi

        echo " ===================== Fonts ====================="
            echo -e " InconsolataLGC Nerd Font \n Apple Fonts \n ttf-font-awesome \n Vazirmatn \n noto fonts emoji"
            read -p " update /etc/fonts/local.conf    :::::    [r]un : " ansLocalconf
            if [[ $ansLocalconf == "r" ]] || [[ $ansLocalconf == "R" ]]; then
                echo -e "\n +++++ copy local.conf \n"
                sudo cp $dotfiles/local.conf /etc/fonts/local.conf
                fc-cache -v
            fi
            echo -e "\n \n"


        echo " ===================== Terminal ====================="
        read -p " lsd    :::::    [r]un : " ansLSD
        if [[ $ansLSD == "r" ]] || [[ $ansLSD == "R" ]]; then
                echo -e "\n +++++ install lsd +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S lsd
                else
                    brew install lsd
                fi
        fi
    echo -e "\n \n"


        echo " ===================== Terminal ====================="
        echo -e " lsd "
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
                yes | cp -rf $dotfiles/.tmux.conf ~/
            fi
        fi
    echo -e "\n \n"


        echo " ===================== Terminal ====================="
        echo -e " lsd \n tmux "
        read -p " aria2 (download manager)   :::::    [r]un: " ansAria2
        if [[ $ansAria2 == "r" ]] || [[ $ansAria2 == "R" ]]; then
                echo -e "\n +++++ install aria2 +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S aria2
                else
                    brew install aria2 
                fi
        fi
    echo -e "\n \n"

        echo " ===================== Terminal ====================="
        echo -e " lsd \n tmux \n aria2"
        read -p " broot (Fuzzy Search + tree + cd)  :::::    [r]un: " ansBroot
        if [[ $ansBroot == "r" ]] || [[ $ansBroot == "R" ]]; then
                echo -e "\n +++++ install broot +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S broot
                else
                    brew install broot               
                fi

                echo -e "\n +++++ copy config files ... +++++ \n"
                sleep 2
                mkdir -p ~/.config/broot
                yes | cp -rf $dotfiles/.config/broot/* ~/.config/broot/
        fi
    echo -e "\n \n"


        echo " ===================== Terminal ====================="
        echo -e " lsd \n tmux \n aria2 \n broot"
        read -p " ripgrep (A search tool that combines the usability of ag with the raw speed of grep) :::::    [r]un: " ansRg
        if [[ $ansRg == "r" ]] || [[ $ansRg == "R" ]]; then
                echo -e "\n +++++ install ripgrep +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    # https://github.com/BurntSushi/ripgrep
                    # example : rg -i def  --->  search def in files
                    sudo pacman -S ripgrep
                else
                    brew install ripgrep
                fi
        fi
    echo -e "\n \n"

        echo " ===================== Terminal ====================="
        echo -e " lsd \n tmux \n aria2 \n broot \n ripgrep"
        read -p " peco (Simplistic interactive filtering tool) :::::    [r]un: " ansPeco
        if [[ $ansPeco == "r" ]] || [[ $ansPeco == "R" ]]; then
                echo -e "\n +++++ install peco +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    # https://github.com/peco/peco
                    # example : rg -i def | peco 
                    sudo pacman -S peco
                else
                    brew install peco
                fi
        fi
    echo -e "\n \n"


        echo " ===================== Terminal ====================="
        echo -e " lsd \n tmux \n aria2 \n broot \n ripgrep \n peco"
        read -p " ack  :::::    [r]un: " ansAck
        if [[ $ansAck == "r" ]] || [[ $ansAck == "R" ]]; then
                echo -e "\n +++++ install ack +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S ack
                else
                    brew install ack
                fi
        fi
    echo -e "\n \n"


        echo " ===================== Terminal ====================="
        echo -e " lsd \n tmux \n aria2 \n broot \n ripgrep \n peco \n ack"
        read -p " lostfiles (Find orphaned files not owned by any Arch packages)   :::::    [r]un: " ansLostfiles
        if [[ $ansLostfiles == "r" ]] || [[ $ansLostfiles == "R" ]]; then
                echo -e "\n +++++ install lostfiles +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S lostfiles
                else
                    brew install lostfiles
                fi
        fi
    echo -e "\n \n"
    
        echo " ===================== Terminal ====================="
        echo -e " lsd \n tmux \n aria2 \n broot \n ripgrep \n peco \n ack \n lostfiles"
        read -p " gh (The GitHub for command line)   :::::    [r]un: " ansGithubcli
        if [[ $ansGithubcli == "r" ]] || [[ $ansGithubcli == "R" ]]; then
                echo -e "\n +++++ install gh +++++ \n"
                if [[ $ansOS == "arch" ]];then
                    # https://cli.github.com/
                    sudo pacman -S github-cli
                else
                    brew install gh
                fi
                gh auth login
        fi
    echo -e "\n \n"
    
    echo " ===================== Terminal ====================="
    echo -e " lsd \n tmux \n aria2 \n broot \n ripgrep \n peco \n ack \n lostfiles \n gh"
     read -p " tldr    :::::    [r]un : " ansTldr
        if [[ $ansTldr == "r" ]] || [[ $ansTldr == "R" ]]; then
                if [[ $ansOS == "arch" ]];then
                    sudo pacman -S tldr
                else
                    brew install tldr
                fi
        fi
    echo -e "\n \n"

        echo " ===================== CheatSheet ====================="
        read -p " CheatSheet    :::::    [r]un : " ansCheatSheet
        if [[ $ansCheatSheet == "r" ]] || [[ $ansCheatSheet == "R" ]]; then
            echo -e "\n +++++ copy /bin to home +++++"
            cp -r $dotfiles/bin ~
        fi
    echo -e "\n \n"



     if [[ $ansOS == "arch" ]]; then
        echo " ===================== GUI APP ====================="
        read -p " kitty    :::::    [r]un : " ansKitty
        if [[ $ansKitty == "r" ]] || [[ $ansKitty == "R" ]]; then
            echo -e "\n +++++ install kitty +++++ \n"
                    sudo pacman -S kitty
            echo -e "\n +++++ copy /kitty to ~/.config/ +++++"
                    mkdir -p ~/.config/kitty
                    yes | cp -rf $dotfiles/.config/kitty/* ~/.config/kitty/
                    sleep 3
        fi
    echo -e "\n \n"


        echo " ===================== GUI APP ====================="
        echo -e " kitty"
        read -p " zathura    :::::    [r]un : " ansZathura
        if [[ $ansZathura == "r" ]] || [[ $ansZathura == "R" ]]; then
            echo -e "\n +++++ install zathura +++++ \n"
                    sudo pacman -S zathura
                    echo -e "\n +++++ copy /zathura to ~/.config/ +++++"
                    mkdir -p ~/.config/zathura
                    yes | cp -rf $dotfiles/.config/zathura* ~/.config/zathura
                    sleep 3
        fi
    echo -e "\n \n"

  


        echo " ===================== GUI APP ====================="
        echo -e " kitty \n zathura "
        read -p " MPV + xdotool + xbindkeys   :::::    [r]un : " ansMpv
        if [[ $ansMpv == "r" ]] || [[ $ansMpv == "R" ]]; then
            echo -e "\n +++++ install MPV +++++ \n"
                    sudo pacman -S mpv
            echo -e "\n copy input.conf file to the ~/.config/mpv"
                    mkdir ~/.config/mpv/
                    yes | cp -rf $dotfiles/.config/mpv/* ~/.config/mpv/
                    sleep 3
                    if [[ $ansOS == "arch" ]];then
                    sudo pacman -S xdotool
                    sudo pacman -S xbindkeys
                    yay -S xbindkeys_config-gtk2
                    yes | cp -rf $dotfiles/.xbindkeysrc ~/.xbindkeysrc 
                    fi
        fi
    echo -e "\n \n"
    fi

rm -rf ~/tmpInstall

echo -e "\n \n"



while ! [[ ( "$ansI3" == "y" ) || ( "$ansI3" == "n" ) ]]; do
    read -p "do you want i3 packages installation : [y]es - [n]o : " ansI3
    echo -e "\n \n"
done

    if [[ $ansI3 == "y" ]]; then
        clear
        echo " ===================== i3 installation ====================="
        read -p " i3    :::::    [r]un : " ansI3gap
        if [[ $ansI3gap == "r" ]] || [[ $ansI3gap == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S i3  \n"
            sudo pacman -S i3 python-i3ipc
                      
            echo -e " \n +++++ Copy i3 configuration files to .config"
            yes | cp -rf $dotfiles/.config/i3 $HOME/.config/
            yes | cp -rf $dotfiles/.Xresources $HOME/
        fi
    echo -e "\n \n"

        echo " ===================== i3 installation ====================="
        echo -e " i3"
        read -p " picom (a compositor add features like shadow, opacity, fading, rounding corner and ... )   :::::    [r]un : " ansPicom
        if [[ $ansPicom == "r" ]] || [[ $ansPicom == "R" ]]; then
            echo -e "\n +++++ yay -S picom-jonaburg-git (another fork of picom with blur ) \n"
            yay -S picom-ibhagwan-git
            
            echo -e " \n +++++ Copy picom configuration files to .config"
            cp $dotfiles/.config/picom.conf $HOME/.config/
            
            echo -e " \n +++++ Setting Nvidia proprietary drivers and FullCompositionPipeline : nvidia-settings -a 'AllowFlipping=0'"
            nvidia-settings -a 'AllowFlipping=0'
            nvidia-settings --load-config-only
        fi
    echo -e "\n \n"

        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom"
        read -p " arandr (monitor configuration)    :::::    [r]un : " ansArandr
        if [[ $ansArandr == "r" ]] || [[ $ansArandr == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S arandr \n"
            sudo pacman -S arandr
        fi
    echo -e "\n \n"


        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr"
        read -p " rofi (launcher)    :::::    [r]un : " ansRofi
        if [[ $ansRofi == "r" ]] || [[ $ansRofi == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S rofi \n"
            sudo pacman -S rofi

            echo -e " \n +++++ Copy rofi configuration files "
            yes | cp -rf $dotfiles/.config/rofi $HOME/.config/
        fi
    echo -e "\n \n"


        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi"
        read -p " polybar (bar)   :::::    [r]un : " ansPolybar
        if [[ $ansPolybar == "r" ]] || [[ $ansPolybar == "R" ]]; then
            echo -e "\n +++++ yay -S polybar \n"
            yay -S polybar
            
            echo -e "\n +++++ install requirements : Fira Code Nerd Font | python-pywal | cava | wmctrl | pacman-contrib | ttf-font-awesome | jq | bc | \n"
            sudo pacman -S python-pywal calc jq bc wmctrl
            yay -S nerd-fonts-fira-code pacman-contrib cava ttf-indic-otf
            
            # Install feather font
            mkdir -p $HOME/.fonts
            yes | cp -rf $dotfiels/.fonts/* $HOME/.fonts/
            fc-cache -fv
            
            sleep 2

            # copy files
            echo -e " \n +++++ Copy polybar configuration "
            yes | cp -rf $dotfiles/.config/polybar $HOME/.config/
            cd ~/.config/polybar/scripts/
            sudo chmod +xwr *.sh

        fi
    echo -e "\n \n"


        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar"
        read -p " dunst (notification manager)    :::::    [r]un : " ansDunst
        if [[ $ansDunst == "r" ]] || [[ $ansDunst == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S dunst libnotify \n"
            sudo pacman -S dunst libnotify
            
            echo -e " \n +++++ Copy dunst configuration "
            yes | cp -rf $dotfiles/.config/dunst $HOME/.config/
            cd ~/.config/polybar/scripts/
            sudo chmod +xwr *.sh
            
        fi
    echo -e "\n \n"


        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst"
        read -p " thunar (file manager)    :::::    [r]un : " ansThunar
        if [[ $ansThunar == "r" ]] || [[ $ansThunar == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S thunar (file manager) \n"
            sudo pacman -S thunar
        fi
    echo -e "\n \n"


        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar"
        read -p " lxappearance (GTK+ theme switcher)   :::::   [r]un : " ansLxappearance
        if [[ $ansLxappearance == "r" ]] || [[ $ansLxappearance == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S lxappearance \n"
            sudo pacman -S lxappearance
        fi
    echo -e "\n \n"



        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance"
        read -p " redshift(color temperature of your screen)    :::::    [r]un : " ansRedshift
        if [[ $ansRedshift == "r" ]] || [[ $ansRedshift == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S redshift \n"
            sudo pacman -S redshift
        fi
    echo -e "\n \n"


        
        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance \n redshift"
        read -p " udevil(Mount and unmount without password)    :::::    [r]un : " ansUdevil
        if [[ $ansUdevil == "r" ]] || [[ $ansUdevil == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S udevil \n"
            yay -S udevil
        fi
    echo -e "\n \n"

        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance \n redshift \n udevil"
        read -p " scrot (screenshot)   :::::    [r]un : " ansScrot
        if [[ $ansScrot == "r" ]] || [[ $ansScrot == "R" ]]; then
            echo -e "\n +++++ yay -S scrot \n"
            mkdir -p $HOME/screenshots
            yay -S scrot
        fi
    echo -e "\n \n"


        
        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance \n redshift \n udevil \n scrot"
        read -p " xclip (clipboard manager)   :::::    [r]un : " ansXclip
        if [[ $ansXclip == "r" ]] || [[ $ansXclip == "R" ]]; then
            echo -e "\n +++++ yay -S xclip \n"
            yay -S xclip
        fi
    echo -e "\n \n"


        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance \n redshift \n udevil \n scrot \n xclip"
        read -p " xfce4 Manager (Power management/Suspend and hibernate)  :::::    [r]un : " ansXfce4Manager
        if [[ $ansXfce4Manager == "r" ]] || [[ $ansXfce4Manager == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S xfce4-power-manager  \n +++++ sudo pacman -S xfce4-settings"
            sudo pacman -S xfce4-power-manager
            #sudo pacman -S xfce4-settings
        fi
    echo -e "\n \n"

        
        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance \n redshift \n udevil \n scrot \n xclip \n xfce4-power-manager"
        read -p " unclutter (hides an inactive mouse)   :::::    [r]un : " ansUnclutter
        if [[ $ansUnclutter == "r" ]] || [[ $ansUnclutter == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S unclutter (hide/unhide mouse) \n"
            sudo pacman -S unclutter
        fi
    echo -e "\n \n"


        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance \n redshift \n udevil \n scrot \n xclip \n xfce4-power-manager \n unclutter"
        read -p " numlockx (Activating numlock on bootup)   :::::    [r]un : " ansNumlockx
        if [[ $ansNumlockx == "r" ]] || [[ $ansNumlockx == "R" ]]; then
            echo -e "\n +++++ sudo pacman -S systemd-numlockontty ... \n"
            sudo pacman -S numlockx
        fi
    echo -e "\n \n"

    
        echo " ===================== i3 installation ====================="
        echo -e " i3 \n picom \n arandr \n rofi \n polybar \n dunst \n thunar \n lxappearance \n redshift \n udevil \n scrot \n xclip \n xfce4-power-manager \n unclutter \n numlockx"
        read -p " nitrogen (set background picture)   :::::    [r]un : " ansNitrogen
        if [[ $ansNitrogen == "r" ]] || [[ $ansNitrogen == "R" ]]; then
            sudo pacman -S nitrogen
            
            echo -e "\n +++++ copy Background file to Picture ... \n"
            cd ~
            mkdir -p Pictures
            cp $dotfiles/wall.jpg  $HOME/.config/
        fi
    echo -e "\n \n"
    
    
      echo " ===================== i3 installation ====================="
        echo -e " miscellaneous :  "
        read -p " mediainfo | ntfs-3g | exfat-utils   :::::    [r]un : " ansMic
        if [[ $ansMic == "r" ]] || [[ $ansMic == "R" ]]; then
            # information of videos and audios
            sudo pacman -S mediainfo
            
            # Allow management of NTFS drives
            sudo pacman -S ntfs-3g
            
            # Allows management of FAT drives
            sudo pacman -S exfat-utils
            
            # A better fuzzy finder for terminal | github.com/jhawthorn/fzy
            sudo pacman -S fzy

        fi


fi

