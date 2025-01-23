# Fedora XFCE + Hyprland

## OS + Window manager
- Install [Fedora XFCE](https://fedoraproject.org/spins/xfce)
- Install hyprland : `sudo dnf install hyprland`
- Exit xfce, log in hyprland
[Optionnal] 
- Mount disk partition at startup
    - Open disk manager
    - Edit mount options for desired partition

## Softwares

### Chrome
- Installation:
    ```
    sudo dnf install fedora-workstation-repositories
    sudo dnf config-manager setopt google-chrome.enabled=1
    sudo dnf install google-chrome-stable
    ```
- Then, Go to chrome://flags -> Ozone -> Enable Wayland

### Doom emacs
- Installation: https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#fedora

### Visual studio code
- Installation:
    ```
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    dnf check-update
    sudo dnf install code # or code-insiders
    ```

### Change display layout (how your screens are placed)
- Installation: https://github.com/nwg-piotr/nwg-displays

### Embedded development
```
sudo dnf install arm-none-eabi-gcc-cs
sudo dnf install openocd
sudo dnf install texlive-scheme-full
```

### SSH keys
- Place your ssh keys in ~/.ssh
- Then, run:
    ```
    sudo chmod 600 ~/.ssh/id_rsa
    sudo chmod 600 ~/.ssh/id_rsa.pub
    ssh-add ~/.ssh/id_rsa
    ```
### PIP (Python package manager)
- Installation: `python -m pip3 install --upgrade pip

### Terminal
- Installation
    ```
    sudo dnf install foot
    sudo dnf install zsh
    chsh -s $(which zsh)
    echo $0 #check shell after reboot
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

## Daemons (Small util programs)
### Screen temperature (Night mode)
```
sudo dnf group install c-development development-tools
sudo dnf install wlsunset
```

### Notification center
```
sudo dnf copr enable erikreider/SwayNotificationCenter
sudo dnf install SwayNotificationCenterd
```

### Wallpaper
```
sudo dnf install hyprpaper
```

### Volume mixer in waybar
```
sudo dnf install pamixer
```

### Screenshots (https://github.com/jtheoof/swappy)
```
sudo dnf install swappy
```
Note : requires the script in `~/.config/hypr`

## Terminal tools
### System infos from terminal
```
sudo dnf install fastfetch
fastfetch --gen-config
```

### btop (Ressource monitor from terminal)
```
sudo dnf install btop
```

## Debug tools
### Check window class
```
sudo dnf install hyprprop
```
Note : Run hyprprop in the terminal then click on the window your want to identify

### Check key name
```
sudo dnf install wev
```

## Themes
### Hyprland color theme
Theme from : https://github.com/dracula/hyprland

### Swaync theme
Theme from : https://github.com/catppuccin/swaync

### Icons theme
```
sudo dnf install papirus-icon-theme
```
Note : must be selected in GNOME tweaks / ngw-look (see below)

### Apply GTK dark theme
- Add/Change these lines in gtk-3.0 and gtk-4.0 config files:
```
[Settings]
gtk-application-prefer-dark-theme=1
```

### Loader theme (Loading screen when booting)
```
dnf search plymouth-theme-spinfinity
plymouth-set-default-theme spinfinity
/usr/libexec/plymouth/plymouth-update-initrd
```

### Modify applications theme globally
- Install a theme :
    ```
    sudo dnf install arc-theme
    ``` 
- Then, select the theme in settings (after download the following gui for settings):
    ```
    sudo dnf install lxappearance
    sudo dnf install gnome-tweaks
    https://github.com/nwg-piotr/nwg-look
    make build
    sudo make install
    ```

### Lightdm settings (Login screen)
```
sudo dnf instal lightdm-gtk-greeter-settings
```

## Fonts

### Nerd fonts (font with glyphs, i.e. text icons)
```
sudo dnf copr enable che/nerd-fonts
sudo dnf install nerd-fonts
```

### Jetbrains font (nice font for coding)
```
sudo dnf copr enable elxreno/jetbrains-mono-fonts
sudo dnf install jetbrains-mono-fonts
```

### Pixel font (Scientifica)
- Download from: https://github.com/oppiliappan/scientifica/releases
- Move .ttf to ~/.local/share/fonts then run: `fc-cache -fv`

## Commands reminder
- MAN
man -Hgoogle-chrome printf
man -f printf
man -k printf

- Sound control 
pavucontrol

- Chrome not running
rm -rf ~/.config/google-chrome/Singleton*

## Experimental (other WM) Fedora + SwayFX
### SwayFX
Follow : https://github.com/WillPower3309/swayfx/blob/master/INSTALL-deb.md
sudo dnf install libwayland-server pcre2-devel wayland-protocols-devel json-c-devel
Install waylandf-server : sudo dnf install 'pkgconfig(wayland-server)'
meson setup build from top git dir
Add add_project_arguments('-Wno-error', language: 'c') to the meson file

### i3 
#### Blur
Picom
