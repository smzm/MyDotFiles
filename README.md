# . FILES
Use ```install.sh``` file for installing programms and dotfiles.

Support _debian_ and _arch_ based linux.

## In `WSL` : 

#### 1. Refresh Pacman GPG keys:
```bash
pacman-key --init
pacman-key --populate
pacman-key --refresh-keys
pacman -Sy archlinux-keyring
pacman -Syu --noconfirm
```

#### 2. Add user
```shell
groupadd sudo
sed -i \'/^#.*%wheel ALL=(ALL:ALL) ALL/s/^#//\' /etc/sudoers
```
```shell
useradd -m -G wheel,sudo -s /bin/bash <username>
passwd <username>
su <username> ; cd ~
```
> Change `<username>` too whatever you want.
  
#### 3. nstall needed packages
```shell
sudo pacman -S python python-pip git --npconfirm --needed
git clone https://github.com/smzm/mydotfiles.git
cd mydotfiles ; python dotfile_installation.py
```
