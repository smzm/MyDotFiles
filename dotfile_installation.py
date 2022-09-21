import os
import sys
import subprocess
from subprocess import call, run, Popen, DEVNULL, STDOUT, PIPE
import re
from sys import stderr, stdout
import inquirer
from rich.console import Console
console = Console()
from rich import print as rprint
import pkg_resources

# Installl modules needed 
required = {'mutagen', 'gTTS'}
installed = {pkg.key for pkg in pkg_resources.working_set}
missing = required - installed
if missing:
    python = sys.executable
    subprocess.check_call([python, '-m', 'pip', 'install', *missing], stdout=subprocess.DEVNULL)



# ===== Get path of dotfiles directory
dotfiles_path = os.popen('echo $PWD').read().rstrip()

# ===== Update pacman packages
run('sudo pacman -Syu --noconfirm', shell=True)


# ===== Install pacman packages

pacman_list = [
 "git",
 "wget",
 "yajl",
 "curl",
 "binutils",
 "network-manager-applet",
 "networkmanager-openvpn",
 "lightdm",
 "lightdm-gtk-greeter", 
 "openssh", 
 "zsh",
 "nodejs",
 "npm",
 "yarn",
 "ruby",
 "python",
 "rust",
 "python-pip",
 "jupyter-notebook",
 "python-ipykernel",
 "pyenv",
 "neovim",
 "xclip",
 "python-pynvim",
 "trash-cli",
 "cronie",
 "lsd",
 "tmux",
 "aria2",
 "broot",
 "ripgrep",
 "peco",
 "ack",
 "lostfiles",
 "github-cli",
 "tldr",
 "kitty",
 "zathura",
 "zathura-pdf-mupdf",
 "mpv",
 "xbindkeys",
 "xdotool",
 "thunar",
 "lxappearance",
 "xfce4-power-manager",
 "xfce4-settings",
 "nitrogen",
 "viewnior",
 "gtk3",
 "ntfs-3g",
 "exfat-utils",
 "i3-gaps",
 "python-i3ipc",
 "arandr",
 "rofi",
 "python-pywal",
 "calc",
 "jq",
 "bc",
 "wmctrl",
 "geoip",
 "dunst",
 "libnotify",
 "redshift",
 "imwheel",
 "numlockx",
 "unclutter",
 "unclutter",
 "fzy",
 "mediainfo",
 "xcolor",
 "conky",
 "pulseaudio",
 "pulseaudio-alsa",
 "pulseaudio-equalizer",
 "pulseaudio-jack",
 "pulseaudio-bluetooth",
 "alsa-utils",
 "alsa-firmware",
 "pavucontrol",
 "bluez",
 "bluez-utils",
 "unrar",
 "unzip",
 "tar",
 "xarchiver",
 "htop",
 "wine",
 "lib32-gnutls",
 "mtpfs",
 "gvfs-mtp" ,
 "gvfs-gphoto2",
 "dnscrypt-proxy",
 "v2ray",
]


pacman_packages_q =[
        inquirer.Checkbox('interest',
        message="What packages do you want to install [SELECT WITH SPACE]? ", 
        choices=["ALL ⬇️", *pacman_list],
        )]
pacman_packages_answers = inquirer.prompt(pacman_packages_q)

if 'ALL ⬇️' in pacman_packages_answers['interest'] : 
    rprint("[bold blue] Installing all packages...")
    os.system(f'sudo pacman -S {" ".join(pacman_list)} --noconfirm')
else : 
    rprint("[italic salmon1] Installing selected packages...")
    selected_pacman_packages = ' '.join(pacman_packages_answers['interest'])
    os.system(f'sudo pacman -S {selected_pacman_packages} --noconfirm')


# ===== Install paru
paru_check = run('paru --version', shell=True, stdout=PIPE, stderr=STDOUT)
if paru_check.returncode == 0 : 
    rprint(':thumbs_up: [bold light_pink3] paru is installed.')
# If paru was not installed
else :
    run('sudo pacman -S --needed base-devel',shell=True)
    run('git clone https://aur.archlinux.org/paru.git', shell=True)
    run('cd paru;  makepkg -si', shell=True)
   
    
# ===== Install paru packages

aur_list = [
'xbindkeys_config-gtk2',
'fluent-reader',
'udevil',
'tailwind-css',
'tailwindcss-language-server',
'picom-ibhagwan-git', 
'polybar',
'pacman-contrib',
'cava',
'ttf-indic-otf',
'spotify',
'sptlrx-bin',
'scrot',
'clipit',
'nerd-fonts-inconsolata',
'nerd-fonts-fira-code',
'apple-fonts',
'ttf-font-awesome',
'vazirmatn-fonts',
'noto-fonts-emoji',
'pulseaudio-ctl',
'bottles',
'jmtpfs',
'flat-remix',
'flatplat-blue-theme',
'apple_cursor',
'qv2ray',
'openvpn3',
'google-chrome',
'visual-studio-code-bin',
]


aur_packages_q =[
        inquirer.Checkbox('interest',
        message="What aur packages do you want to install [SELECT WITH SPACE] ? ", 
        choices=["ALL ⬇️", *aur_list],
        )]
aur_packages_answers = inquirer.prompt(aur_packages_q)

if 'ALL ⬇️' in aur_packages_answers['interest'] : 
    rprint("[bold blue] Installing all packages...")
    os.system(f'paru -S {" ".join(aur_list)} --noconfirm')
else : 
    rprint("[italic salmon1] Installing selected packages...")
    selected_aur_packages = ' '.join(aur_packages_answers['interest'])
    os.system(f'paru -S {selected_aur_packages} --noconfirm')



# ===== ZSH configuration
run('sudo usermod -s /usr/bin/zsh $(whoami)', shell=True, stdout=DEVNULL, stderr=STDOUT)
run('sudo chsh -s $(which zsh)', shell=True, stdout=DEVNULL, stderr=STDOUT)

# OH-MY-ZSH
if run('',  shell=True).returncode == 0 :
    rprint(':thumbs_up: [bold light_pink3] oh-my-zsh is installed.')
else : 
    os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')

# zsh-syntax-highlighting
if run('test -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/', shell=True).returncode==0 :
    rprint(':thumbs_up: [bold light_pink3] zsh-syntax-highlighting installed')
else : 
    os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting')

# zsh-auto-suggestions
if run('test -e ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/', shell=True).returncode==0:
    rprint(':thumbs_up: [bold light_pink3] zsh-auto-suggestions is installed.')
else : 
    os.system('git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions')

# Starship
starship_check = run('starship --version',shell=True, stdout=PIPE, stderr=STDOUT)
if starship_check.returncode == 127 :
    os.system('curl -sS https://starship.rs/install.sh | sh')
    # if starship was not installed
else :
    rprint(':thumbs_up: [bold light_pink3] Starship is installed.')

# zshrc 
os.system(f'cp {dotfiles_path}/.zshrc {dotfiles_path}/.zshenv ~')
zsh_is_runned = run('ps -eo pid,user,stat,comm | grep zsh', shell=True, stdout=PIPE, stderr=DEVNULL)
if not zsh_is_runned : 
    os.system('zsh')


# ===== Node configuration
os.system('mkdir -p ~/.npm')
os.system('npm config set prefix ~/.npm')


os.system('echo "\n"')

# ===== Python packages
python_packages_list = ['numpy', 'pandas', 'scipy', 'sympy', 'matplotlib', 'plotly', 'python-language-server', 'pynvim']
python_package = [
  inquirer.Checkbox('interest',
                    message="Install python packages [SELECT WITH SPACE] : ",
                    choices=['ALL ⬇️', *python_packages_list],
                    ),
]
python_package_answers = inquirer.prompt(python_package)

if 'ALL ⬇️' in python_package_answers['interest'] : 
    for package in python_packages_list:
        run(f'pip install {package} --upgrade', shell=True) 
else :
    for package in python_package_answers['interest']:
        run(f'pip install {package} --upgrade', shell=True) 

# ===== Npm packages
npm_packages_list = ['pyright', 'vim-language-server', 'vscode-langservers-extracted', 'typescript', 'typescript-language-server', 'awk-language-server', 'dockerfile-language-server-nodejs', 'emmet-ls', 'bash-language-server', 'yaml-language-server', 'neovim']
npm_package = [
  inquirer.Checkbox('interest',
                    message="Install npm packages [SELECT WITH SPACE] : ",
                    choices=['ALL ⬇️', *npm_packages_list],
                    ),
]
npm_package_answers = inquirer.prompt(npm_package)

if 'ALL ⬇️' in npm_package_answers['interest'] : 
    for package in npm_packages_list:
        run(f'npm install -g {package}', shell=True) 
else :
    for package in npm_package_answers['interest']:
        run(f'npm install -g {package}', shell=True) 



# ===== Neovim Installation
# VIM-PLUG
os.system("sh -c 'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")
os.system("mkdir -p $HOME/.config/nvim")
os.system(f"yes | cp -rf {dotfiles_path}/.config/nvim/* ~/.config/nvim/")
os.system('nvim +"PlugInstall --sync" +qa')


# ===== Font Configuration
os.system(f'sudo cp {dotfiles_path}/etc/local.conf /etc/fonts/local.conf')
# Install feather font
os.system('mkdir -p $HOME/.fonts')
os.system(f'yes | cp -rf {dotfiles_path}/.fonts/* $HOME/.fonts/')
os.system('fc-cache -fv')



# ===== Trash-cli configuration
os.system('sudo mkdir -p --parent /.Trash')
os.system('sudo chmod a+rw /.Trash')
os.system('sudo chmod +t /.Trash')
if not run('crontab -l | grep "trash-empty"', shell=True, stdout=DEVNULL, stderr=STDOUT) :
    os.system('(crontab -l ; echo "@daily $(which trash-empty) 30") | crontab -')

# ===== Tmux configuration
run(f'yes | cp -rf {dotfiles_path}/.tmux.conf ~/', shell=True, stdout=DEVNULL)

# ===== Gh configuration
run('sudo systemctl start sshd.service ; sudo systemctl enable sshd.service', shell=True, stdout=DEVNULL)
# os.system('gh auth login')

# ===== bin
run(f'yes | cp -rf {dotfiles_path}/bin ~', shell=True, stdout=DEVNULL)

# ===== Kitty configuration
run('mkdir -p ~/.config/kitty', shell=True, stdout=DEVNULL)
run(f'yes | cp -rf {dotfiles_path}/.config/kitty/* ~/.config/kitty/', shell=True, stdout=DEVNULL)

# ===== Zathura configuration
run('mkdir -p ~/.config/zathura', shell=True, stdout=DEVNULL)
run(f'yes | cp -rf {dotfiles_path}/.config/zathura/* ~/.config/zathura', shell=True, stdout=DEVNULL)

# ===== Mpv configuration
run('mkdir -p ~/.config/mpv/', shell=True, stdout=DEVNULL)
run(f'yes | cp -rf {dotfiles_path}/.config/mpv/* ~/.config/mpv/', shell=True, stdout=DEVNULL)
run(f'yes | cp -rf {dotfiles_path}/.xbindkeysrc ~/.xbindkeysrc', shell=True, stdout=DEVNULL)

# ===== Nitrogen configuration
run('mkdir -p ~/Pictures', shell=True, stdout=DEVNULL)
run(f'cp {dotfiles_path}/wall.jpg  $HOME/.config/', shell=True, stdout=DEVNULL)

# ===== GTK-3.0 configuration
# run('mkdir -p ~/.config/gtk-3.0/', shell=True, stdout=DEVNULL)
# run(f'yes | cp -rf {dotfiles_path}/.config/gtk-3.0 $HOME/.config/', shell=True, stdout=DEVNULL)
run(f'yes | cp -rf {dotfiles_path}/.config/mimeapps.list $HOME/.config/', shell=True, stdout=DEVNULL)

# ===== I3 configuration
run(f'yes | cp -rf {dotfiles_path}/.config/i3 $HOME/.config/', shell=True, stdout=DEVNULL)
run(f'yes | cp -rf {dotfiles_path}/.Xresources $HOME/', shell=True, stdout=DEVNULL)

# ===== Picom configuration
run(f'yes | cp -rf {dotfiles_path}/.config/picom.conf $HOME/.config/', shell=True, stdout=DEVNULL)

# ===== Rofi configuration
run(f'yes | cp -rf {dotfiles_path}/.config/rofi $HOME/.config/', shell=True, stdout=DEVNULL)

# ===== Polybar configuration
run(f'yes | cp -rf {dotfiles_path}/.config/polybar $HOME/.config/', shell=True, stdout=DEVNULL)
run('cd ~/.config/polybar/scripts/ ; sudo chmod +xwr *.sh', shell=True, stdout=DEVNULL)

# ===== Dunst configuration
run(f'yes | cp -rf {dotfiles_path}/.config/dunst $HOME/.config/', shell=True, stdout=DEVNULL)
run('cd ~/.config/polybar/scripts/ ; sudo chmod +xwr *.sh', shell=True, stdout=DEVNULL)

# ===== Scrot configuration
run('mkdir -p $HOME/screenshots', shell=True, stdout=DEVNULL)


# ===== Imwheel configuration
run(f'yes | cp -rf {dotfiles_path}/.imwheelrc  $HOME/', shell=True, stdout=DEVNULL)


# ===== Conky configuration
run(f'yes | cp -rf {dotfiles_path}/.config/conky $HOME/.config/', shell=True, stdout=DEVNULL)


# ===== Disable IPv6 in NetworkManager
run('nmcli -t -f NAME,TIMESTAMP con | sort -t: -nk2 | tail -n1 | cut -d: -f1 | xargs -I {} nmcli connection modify {} ipv6.method "disabled"', shell=True, stdout=DEVNULL)
run("sudo sed -i 's/^[[:space:]]*::/#::/' /etc/hosts", shell=True, stdout=DEVNULL)

# ===== Pacman configuration
run("sudo sed -i -e 's/^#Color/Color/g' /etc/pacman.conf", shell=True, stdout=DEVNULL)
run("sudo sed -i 's/^#ParallelDownloads.*/ParallelDownloads=5/g' /etc/pacman.conf", shell=True, stdout=DEVNULL)

# ===== Lightdm configuration
run("sudo sed -i '/^\[Seat:\*\]$/,/\[/s/^#greeter-session=.*$/greeter-session=lightdm-gtk-greeter/' /etc/lightdm/lightdm.conf", shell=True, stdout=DEVNULL)
run("whoami | xargs -I {} sudo sed -i '/^\[Seat:\*\]$/,/\[/s/^#autologin-user=.*/autologin-user={}/' /etc/lightdm/lightdm.conf", shell=True, stdout=DEVNULL)
run("echo $DESKTOP_SESSION | xargs -I {} sudo sed -i '/^\[Seat:\*\]$/,/\[/s/^#autologin-session=.*$/autologin-session={}/' /etc/lightdm/lightdm.conf", shell=True, stdout=DEVNULL)
run('sudo systemctl enable lightdm.service', shell=True, stdout=DEVNULL)

# ===== Bluetooth 
run('sudo systemctl enable bluetooth.service', shell=True, stdout=DEVNULL)


# ===== Jupyter configuration
run('mkdir -p ~/.jupyter/custom/', shell=True, stdout=DEVNULL)
run(f'yes | sudo cp -rf {dotfiles_path}/.jupyter/custom/* ~/.jupyter/custom/', shell=True, stdout=DEVNULL)


# ===== Appearance 
# Apple_cursor
run('mkdir -p ~/.icons', shell=True, stdout=DEVNULL)
run('wget https://github.com/ful1e5/apple_cursor/releases/latest/download/macOSMonterey.tar.gz -P ~/.icons', shell=True, stdout=DEVNULL)
run('tar xvf ~/.icons/macOSMonterey.tar.gz', shell=True, stdout=DEVNULL)
run('rm ~/.icons/macOSMonterey.tar.gz', shell=True, stdout=DEVNULL)


# ===== Hibernate
hibernate_q = [
  inquirer.List('hibernate',
                message="Do you have any partion swap for enabling hibernate ? ",
                choices=['Yes', 'No'],
            ),
]
hibernate_answers = inquirer.prompt(hibernate_q)

if (hibernate_answers['hibernate'] == 'Yes') : 
    run('sudo blkid | grep \'swap\' | grep -o \'[[:space:]]UUID="[a-zA-Z0-9\-]*"\' | grep -o \'[a-zA-Z0-9\-]*\' | tail -n1 | xargs echo | xargs -I {} sudo sed -i \'/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/"$/ resume=UUID={}"/\' /etc/default/grub', shell=True, stdout=DEVNULL)
    run("sudo sed -i '/^HOOKS=/ s/)$/ resume)/' /etc/mkinitcpio.conf", shell=True, stdout=DEVNULL)
    run("sudo grub-mkconfig -o /boot/grub/grub.cfg", shell=True)
    run("sudo mkinitcpio -P", shell=True)
else :
    pass 



# ===== Install and Configure DOH (DNS OVER HTTPS)
os.system(f"sudo cp -f {dotfiles_path}/etc/dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml")
# change /etc/resolve.conf
os.system('sudo chattr -i /etc/resolv.conf')
os.system('sudo sh -c "echo nameserver 127.0.0.1 > /etc/resolv.conf"')
os.system('sudo sh -c "echo options edns0 single-request-reopen >> /etc/resolv.conf"')
os.system('sudo chattr +i /etc/resolv.conf')
os.system('sudo systemctl start dnscrypt-proxy ; sudo systemctl enable dnscrypt-proxy')
os.system('sudo systemctl restart NetworkManager')


# ===== Check
rprint('[bold green] pacman packages installed :')
if 'ALL ⬇️' in pacman_packages_answers['interest'] : 
    os.system(f'sudo pacman -Q {" ".join(pacman_list)}')
else : 
    selected_pacman_packages = ' '.join(pacman_packages_answers['interest'])
    os.system(f'sudo pacman -Q {selected_pacman_packages}')


rprint('[bold green] yay packages installed :')
if 'ALL ⬇️' in aur_packages_answers['interest'] : 
    os.system(f'paru -Q {" ".join(aur_list)}')
else : 
    selected_aur_packages = ' '.join(aur_packages_answers['interest'])
    os.system(f'paru -Q {selected_aur_packages}')
