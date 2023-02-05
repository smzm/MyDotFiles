# . FILES

<br>

## Installing in `Arch` : 
```shell
sudo pacman -S python python-pip git --noconfirm --needed
git clone https://github.com/smzm/mydotfiles.git
```

and Use `dotfile_installation.py` python file for installing programms and dotfiles.


<br>
<br>


## Installing in `WSL` :
- ### 1. Install ArchWsl 
Download [yuk7/ArchWSL](https://github.com/yuk7/ArchWSL) installer zip, pick a folder and run `arch.exe` in that folder.

- ### 2. Refresh Pacman GPG keys:
```bash
pacman-key --init
pacman-key --populate
pacman-key --refresh-keys
pacman -Sy archlinux-keyring
pacman -Syyu --noconfirm
```

- ### 3. Add user
```shell
groupadd sudo
sed -i '/^#.*%wheel ALL=(ALL:ALL) ALL/s/^#//' /etc/sudoers
```
```shell
useradd -m -G wheel,sudo -s /bin/bash <username>
passwd <username>
su <username> ; cd ~
```
> Change `<username>` too whatever you want.
  
- ### 4. Install needed packages
```shell
sudo pacman -S python python-pip git --noconfirm --needed
git clone https://github.com/smzm/mydotfiles.git
```

- ### 5. Install through `dotfile_installation.py`
```bash
cd mydotfiles
python dotfile_installation.py
```

- ### 6. Setting ArchLinux as default WSL
Just run `wsl --set-default Arch` in windows command shell.

- ### 7. Setting default user in `Arch` 
To setting default user in windows command shell got to the arch direcctory and run : `Arch.exe config --default-user <username>`

- ### 8. Config Windows Terminal [optional]
Config you windows terminal settings like [this](./windowsTerminal/readme.md)
