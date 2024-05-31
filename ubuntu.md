## Get upgrades
```bash
sudo apt upgrade -y
```

## Install dependencies
```bash
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev procps file git wget unzip
```

## Install zsh and  Set zsh as default shell
```bash
sudo apt install zsh -y
```
```bash
chsh -s $(which zsh)
```

## Install oh-my-zsh
```bash
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

## Install basics softwares
```bash
sudo apt install nodejs npm python pip -y
```

## install Bun
```bash
mkdir -p ~/.npm
npm config set prefix ~/.npm
npm install -g npm@latest
```
```bash
npm install -g npm@latest
```
```bash
curl -fsSL https://bun.sh/install | bash
```
