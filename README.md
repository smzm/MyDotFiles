# . FILES
Use ```install.sh``` file for installing programms and dotfiles.

Support _debian_ and _arch_ based linux.

## In `WSL` : 
```shell
pacman-key --init
pacman-key --populate
pacman-key --refresh-keys
pacman -Sy archlinux-keyring
sudo pacman -Syu --noconfirm

groupadd sudo
echo export EDITOR=vim >> ~/.bashrc ; source .bashrc

useradd -m -G wheel,sudo -s /bin/bash <username>
sed -i \'/^#.*%wheel ALL=(ALL:ALL) ALL/s/^#//\' /etc/sudoers
passwd <username>
su rodd
cd ~

sudo pacman -S python python-pip git --npconfirm --needed
git clone https://github.com/smzm/mydotfiles.git
``
