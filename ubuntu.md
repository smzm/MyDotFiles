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
- zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- zsh-auto-suggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
- fzf
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; ~/.fzf/install
```

- Copy `.zshrc` from [here](https://github.com/smzm/MyDotFiles/blob/master/.zshrc) and paste in `~/.zshrc`

## Install Brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Installing packages by brew
```bash
brew install lsd neovim
```

## Install basics softwares
```bash
sudo apt install nodejs npm python pip ruby -y
```

## install Bun
```bash
mkdir -p ~/.npm
npm config set prefix ~/.npm
npm install -g npm@latest
```
```bash
curl -fsSL https://bun.sh/install | bash
```

## Install npm packages 
```bash
npm install pyright vim-language-server vscode-langservers-extracted typescript typescript-language-server awk-language-server dockerfile-language-server-nodejs emmet-ls bash-language-server yaml-language-server neovim
```

## Install Nvidia Cuda toolkit
```bash
sudo apt install nvidia-cuda-toolkit
```
