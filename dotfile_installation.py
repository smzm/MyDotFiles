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



# # ===== Get user name
# # username_q = [inquirer.Text('name', message="What's your username ? ")]
# # username = inquirer.prompt(username_q)

# os.system('clear')


# # ===== Get path of dotfiles directory
# dotfiles_path = os.popen('echo $PWD').read().rstrip()

# # ===== Update pacman packages
# run('sudo pacman -Syu --noconfirm', shell=True)


# # ===== Install pacman packages

# pacman_list = [
#  "git",
#  "wget",
#  "yajl",
#  "curl",
#  "binutils",
#  "lightdm",
#  "lightdm-gtk-greeter", 
#  "openssh", 
#  "zsh",
#  "nodejs",
#  "npm",
#  "yarn",
#  "ruby",
#  "python",
#  "rust",
#  "python-pip",
#  "jupyter-notebook",
#  "python-ipykernel",
#  "pyenv",
#  "neovim",
#  "xclip",
#  "python-pynvim",
#  "trash-cli",
#  "lsd",
#  "tmux",
#  "aria2",
#  "broot",
#  "ripgrep",
#  "peco",
#  "ack",
#  "lostfiles",
#  "github-cli",
#  "tldr",
#  "kitty",
#  "zathura",
#  "zathura-pdf-mupdf",
#  "mpv",
#  "xbindkeys",
#  "xdotool",
#  "thunar",
#  "lxappearance",
#  "xfce4-power-manager",
#  "xfce4-settings",
#  "nitrogen",
#  "viewnior",
#  "gtk3",
#  "ntfs-3g",
#  "exfat-utils",
#  "i3-gaps",
#  "python-i3ipc",
#  "arandr",
#  "rofi",
#  "python-pywal",
#  "calc",
#  "jq",
#  "bc",
#  "wmctrl",
#  "geoip",
#  "dunst",
#  "libnotify",
#  "redshift",
#  "imwheel",
#  "numlockx",
#  "unclutter",
#  "unclutter",
#  "fzy",
#  "mediainfo",
#  "xcolor",
#  "conky",
#  "pulseaudio",
#  "pulseaudio-alsa",
#  "pulseaudio-equalizer",
#  "pulseaudio-jack",
#  "pulseaudio-bluetooth",
#  "alsa-utils",
#  "alsa-firmware",
#  "pavucontrol",
#  "bluez",
#  "bluez-utils",
#  "unrar",
#  "unzip",
#  "tar",
#  "xarchiver",
#  "htop",
#  "wine",
#  "lib32-gnutls",
#  "mtpfs",
#  "gvfs-mtp" ,
#  "gvfs-gphoto2",
#  "dnscrypt-proxy",
#  "v2ray",
# ]



# pacman_packages_q =[
#         inquirer.Checkbox('interest',
#         message="What packages do you want to install ? ", 
#         choices=["ALL ⬇️", *pacman_list],
#         )]
# packages = inquirer.prompt(pacman_packages_q)

# if 'ALL ⬇️' in packages['interest'] : 
#     rprint("[bold blue] Installing all packages...")
#     os.system(f'sudo pacman -S {" ".join(pacman_list)} --needed --noconfirm')
# else : 
#     rprint("[italic salmon1] Installing selected packages...")
#     selected_pacman_packages = ' '.join(packages['interest'])
#     os.system(f'sudo pacman -S {selected_pacman_packages} --needed --noconfirm')


# # ===== Install and Configure DOH (DNS OVER HTTPS)
# os.system(f"sudo cp -f {dotfiles_path}/etc/dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml")
# # change /etc/resolve.conf
# os.system('sudo chattr -i /etc/resolv.conf')
# os.system('sudo sh -c "echo nameserver 127.0.0.1 > /etc/resolv.conf"')
# os.system('sudo sh -c "echo options edns0 single-request-reopen >> /etc/resolv.conf"')
# os.system('sudo chattr +i /etc/resolv.conf')
# os.system('sudo systemctl start dnscrypt-proxy ; sudo systemctl enable dnscrypt-proxy')
# os.system('sudo systemctl restart NetworkManager')


# # ===== Install paru
# paru_check = run('paru --version', shell=True, stdout=PIPE, stderr=STDOUT)
# if paru_check.returncode == 0 : 
#     rprint(':thumbs_up: [bold light_pink3] paru is installed.')
# # If paru was not installed
# else :
#     run('sudo pacman -S --needed base-devel',shell=True)
#     run('git clone https://aur.archlinux.org/paru.git', shell=True)
#     run('cd paru;  makepkg -si', shell=True)
   
    
# # ===== Install paru packages

# aur_list = [
# 'xbindkeys_config-gtk2',
# 'fluent-reader',
# 'udevil',
# 'tailwind-css',
# 'tailwindcss-language-server',
# 'picom-ibhagwan-git', 
# 'polybar',
# 'pacman-contrib',
# 'cava',
# 'ttf-indic-otf',
# 'spotify',
# 'sptlrx-bin',
# 'scrot',
# 'clipit',
# 'nerd-fonts-inconsolata',
# 'nerd-fonts-fira-code',
# 'apple-fonts',
# 'ttf-font-awesome',
# 'vazirmatn-fonts',
# 'noto-fonts-emoji',
# 'pulseaudio-ctl',
# 'bottles',
# 'jmtpfs',
# 'flat-remix',
# 'flatplat-blue-theme',
# 'apple_cursor',
# 'qv2ray',
# 'openvpn3',
# 'google-chrome',
# 'visual-studio-code-bin',
# ]
# aur_packages_q =[
#         inquirer.Checkbox('interest',
#         message="What packages do you want to install ? ", 
#         choices=["ALL ⬇️", *aur_list],
#         )]
# packages = inquirer.prompt(aur_packages_q)

# if 'ALL ⬇️' in packages['interest'] : 
#     rprint("[bold blue] Installing all packages...")
#     os.system(f'paru -S {" ".join(aur_list)} --needed --noconfirm')
# else : 
#     rprint("[italic salmon1] Installing selected packages...")
#     selected_aur_packages = ' '.join(packages['interest'])
#     os.system(f'paru -S {selected_aur_packages} --needed --noconfirm')



# # ===== ZSH configuration
# run('sudo usermod -s /usr/bin/zsh $(whoami)', shell=True, stdout=DEVNULL, stderr=STDOUT)
# run('sudo chsh -s $(which zsh)', shell=True, stdout=DEVNULL, stderr=STDOUT)

# # OH-MY-ZSH
# if run('',  shell=True).returncode == 0 :
#     rprint(':thumbs_up: [bold light_pink3] oh-my-zsh is installed.')
# else : 
#     os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')

# # zsh-syntax-highlighting
# if run('test -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/', shell=True).returncode==0 :
#     rprint(':thumbs_up: [bold light_pink3] zsh-syntax-highlighting installed')
# else : 
#     os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting')

# # zsh-auto-suggestions
# if run('test -e ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/', shell=True).returncode==0:
#     rprint(':thumbs_up: [bold light_pink3] zsh-auto-suggestions is installed.')
# else : 
#     os.system('git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions')

# # Starship
# starship_check = run('starship --version',shell=True, stdout=PIPE, stderr=STDOUT)
# if starship_check.returncode == 127 :
#     os.system('curl -sS https://starship.rs/install.sh | sh')
#     # if starship was not installed
# else :
#     rprint(':thumbs_up: [bold light_pink3] Starship is installed.')

# # zshrc 
# os.system(f'cp {dotfiles_path}/.zshrc {dotfiles_path}/.zshenv ~')
# zsh_is_runned = run('ps -eo pid,user,stat,comm | grep zsh', shell=True, stdout=PIPE, stderr=DEVNULL)
# if not zsh_is_runned : 
#     os.system('zsh')


# # ===== Node configuration
# os.system('mkdir -p ~/.npm')
# os.system('npm config set prefix ~/.npm')

# ===== Python packages
# python_packages_list = ['numpy', 'pandas', 'scipy', 'sympy', 'matplotlib', 'plotly', 'python-language-server', 'pynvim']
# python_package = [
#   inquirer.Checkbox('interest',
#                     message="Install python packages : ",
#                     choices=['ALL ⬇️', *python_packages_list],
#                     ),
# ]
# python_package_answers = inquirer.prompt(python_package)

# if 'ALL ⬇️' in python_package_answers['interest'] : 
#     for package in python_packages_list:
#         run(f'pip install {package} --upgrade', shell=True) 
# else :
#     for package in python_package_answers['interest']:
#         run(f'pip install {package}' --upgrade, shell=True) 

# ===== Npm packages
# npm_packages_list = ['pyright', 'vim-language-server', 'vscode-langservers-extracted', 'typescript', 'typescript-language-server', 'awk-language-server', 'dockerfile-language-server-nodejs', 'emmet-ls', 'bash-language-server', 'yaml-language-server', 'neovim']
# npm_package = [
#   inquirer.Checkbox('interest',
#                     message="Install npm packages : ",
#                     choices=['ALL ⬇️', *npm_packages_list],
#                     ),
# ]
# npm_package_answers = inquirer.prompt(npm_package)

# if 'ALL ⬇️' in npm_package_answers['interest'] : 
#     for package in npm_packages_list:
#         run(f'npm install -g {package}', shell=True) 
# else :
#     for package in npm_package_answers['interest']:
#         run(f'npm install -g {package}', shell=True) 



# ===== Neovim Installation
# VIM-PLUG
 sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
 mkdir -p $HOME/.config/nvim
 yes | cp -rf $dotfiles/.config/nvim/* ~/.config/nvim/



# ===== Font Configuration
# ===== Trash-cli configuration
# ===== Tmux configuration
# ===== Gh configuration
# ===== bin
# ===== Kitty configuration
# ===== Zathura configuration
# ===== Mpv configuration
# ===== Nitrogen configuration
# ===== GTK-3.0 configuration
# ===== I3 configuration
# ===== Picom configuration
# ===== Rofi configuration
# ===== Polybar configuration
# ===== Dunst configuration
# ===== Scrot configuration
# ===== Imwheel configuration
# ===== Conky configuration
# ===== Disable IPv6 in NetworkManager
# ===== Pacman configuration
# ===== Lightdm configuration
# ===== Appearance 
# ===== Jupyter configuration





