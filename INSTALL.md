# Fedora + Hyprland

## OS
- Download [Fedora Workstation](https://fedoraproject.org/workstation/)

## WM
- `sudo dnf install -y hyprland`
- Exit DE, log in hyprland

## Disk mounting
- Mount disk partition at startup
    - Open disk manager
    - Edit mount options for desired partition

## Softwares

- [master guide](https://wiki.hyprland.org/Getting-Started/Master-Tutorial/)
[Optionnal]
- [awesome-list](https://github.com/hyprland-community/awesome-hyprland)

### Chrome
```
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install -y google-chrome-stable
```
- Then, Go to chrome://flags -> Ozone -> Enable Wayland

### [Doom emacs](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#fedora)
```
sudo dnf install -y emacs git ripgrep
sudo dnf install -y fd-find    # is 'fd' in Fedora <28
```

### Visual studio code
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code # or code-insiders
```
- Note: A custom color theme in vscode might mess with wayland, disable if if doesnt want to use Wayland (red borders)

### Application search (Wofi)
```
sudo dnf install -y wofi
```

### Change display layout (how your screens are placed)
```
cd ~/Downloads
git clone https://github.com/nwg-piotr/nwg-displays.git
cd nwg-displays
chmod +x install.sh
sudo ./install.sh
```

### Embedded development
```
sudo dnf install -y arm-none-eabi-gcc-cs
sudo dnf install -y openocd
sudo dnf install -y texlive-scheme-full
```

### Visible software in search
```
sudo dnf install -y alacarte
```

### PIP (Python package manager)
```
sudo dnf install -y python3-pip
pip3 install --upgrade pip
```

### Bluetooth manager
- Installation:
```
sudo dnf install -y blueman
```

### Network manager
```
sudo dnf install -y network-manager-applet
```
- Note: run with nm-applet 

### Sound manager
```
sudo dnf install -y pamixer
```

### Terminal
```
sudo dnf install -y foot #terminal
sudo dnf install -y zsh #shell
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

### Screen temperature (Night mode)
```
sudo dnf group install c-development development-tools
sudo dnf install -y wlsunset
```

### Notification center
```
sudo dnf copr enable erikreider/SwayNotificationCenter
sudo dnf install -y SwayNotificationCenterd
```

### Wallpaper
```
sudo dnf install -y hyprpaper
```

### Status bar
```
sudo dnf install -y waybar
```

### Notifcation daemon
```
sudo dnf install -y swaync
```

### Volume mixer in waybar
```
sudo dnf install -y pamixer
```

### Screenshots
```
sudo dnf install -y hyprshot
```

## Terminal tools
### System infos from terminal
```
sudo dnf install -y fastfetch
fastfetch --gen-config
```

### btop (Ressource monitor from terminal)
```
sudo dnf install -y btop
```

## Debug tools
### Check window class
```
sudo dnf install -y hyprprop
```
- Note: Run hyprprop in the terminal then click on the window to identify

### Check key name
```
sudo dnf install -y wev
```

## Themes
### Hyprland color theme
Theme from: https://github.com/dracula/hyprland

### Swaync theme
Theme from: https://github.com/catppuccin/swaync

### Icons theme
```
sudo dnf install -y papirus-icon-theme
```
- Note: must be selected in GNOME tweaks / ngw-look (see below)

### Cursor theme
```
sudo dnf copr enable peterwu/rendezvous
sudo dnf install -y bibata-cursor-themes
```

### Apply system themes
- GTK
```
sudo dnf install -y ngw-look
sudo dnf install -y gnome-tweaks
```
- QT
```
sudo dnf install -y qt5ct
sudo dnf install -y qt6ct
```

### Loader theme (Loading screen when booting)
```
sudo dnf install -y plymouth-theme-spinfinity
sudo plymouth-set-default-theme spinfinity
sudo /usr/libexec/plymouth/plymouth-update-initrd
```

### Lightdm settings (Login screen)
```
sudo dnf instal lightdm-gtk-greeter-settings
```

## Fonts

### Nerd fonts (font with glyphs, i.e. text icons)
```
sudo dnf copr enable che/nerd-fonts
sudo dnf install -y nerd-fonts
```

### Jetbrains font (nice font for coding)
```
sudo dnf copr enable elxreno/jetbrains-mono-fonts
sudo dnf install -y jetbrains-mono-fonts
```

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

- Sound control
```
pavucontrol
```

- Chrome not running
```
rm -rf ~/.config/google-chrome/Singleton*
```

## Fedora + SwayFX (Experimental)
### SwayFX
Follow : https://github.com/WillPower3309/swayfx/blob/master/INSTALL-deb.md
```
sudo dnf install -y libwayland-server pcre2-devel wayland-protocols-devel json-c-devel
```
Install waylandf-server:
```
sudo dnf install -y 'pkgconfig(wayland-server)'
meson setup build from top git dir
```
Add add_project_arguments('-Wno-error', language: 'c') to the meson file

### i3 
#### Blur
Picom
