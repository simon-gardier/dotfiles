# Ubuntu + Pop Shell

## OS
 Download [Ubuntu Desktop](https://ubuntu.com/download)

## Pop Shell
```
sudo apt update
sudo apt install gnome-tweaks
sudo apt install git node-typescript make gnome-shell-extension-prefs
git clone https://github.com/pop-os/shell.git
cd shell
git checkout master_noble # For Ubuntu 24.04, 24.10, and later versions.
make local-install
```

## Disk mounting
- Mount disk partition at startup
- Open disk manager
- Edit mount options for desired partition

## Softwares

### [Doom emacs](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org)
```
sudo apt install -y emacs git ripgrep
```

### PIP (Python package manager)
```
sudo apt install -y python3-pip
pip3 install --upgrade pip
```

### Terminal
```
sudo apt install -y foot #terminal
sudo apt install -y zsh #shell
chsh -s $(which zsh) #use zsh
echo $0 #check shell changes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc
```

## Other

### SSH keys (Add already existing ssh keys)
```
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
ssh-add ~/.ssh/id_rsa
```

## Terminal tools
### System infos from terminal
```
sudo apt install -y fastfetch
fastfetch --gen-config
```

### btop (Ressource monitor from terminal)
```
sudo dnf install -y btop
```

### Icons theme
```
sudo apt install -y papirus-icon-theme
```
- Note: must be selected in GNOME tweaks / ngw-look (see below)

### Cursor theme
bibata-cursor-themes

### Jetbrains font (nice font for coding)
jetbrains-mono-fonts

### Pixel font (Scientifica)
```
cd ~/Downloads
wget https://github.com/oppiliappan/scientifica/releases/download/v2.3/scientifica.tar
tar -xvf scientifica.tar
mkdir -p ~/.local/share/fonts/scientifica
cp -r scientifica/* ~/.local/share/fonts/scientifica/
fc-cache -fv
rm -rf scientifica.tar scientifica
```

## Commands reminder / fixes
- MAN
```
man -Hgoogle-chrome printf
man -f printf
man -k printf
```
