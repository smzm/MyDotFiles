# . FILES
Use ```install.sh``` file for installing programms and dotfiles.

Support _debian_ and _arch_ based linux.

<br>


## Installing in `WSL` : 

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
  
#### 3. Install needed packages
```shell
sudo pacman -S python python-pip git --npconfirm --needed
git clone https://github.com/smzm/mydotfiles.git
```

#### 4. Install through `dotfile_installation.py`
```bash
cd mydotfiles ; python dotfile_installation.py
```

#### 5. Setting ArchLinux as default WSL
Just run `wsl --set-default Arch` in windows command shell.

#### 6. Setting default user in `Arch` 
To setting default user in windows command shell got to the arch direcctory and run : `Arch.exe config --default-user <username>`

