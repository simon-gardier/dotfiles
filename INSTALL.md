# Fedora XFCE + Hyprland

- Install hyprland
sudo dnf install hyprland
Exit xfce, log in hyprland

- [Optionnal] Mount disk partition at startup
open disk manager
> Edit mount options for desired partition

## Softwares

- Chrome
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install google-chrome-stable
Go to chrome://flags -> Ozone -> Enable Wayland

- Visual studio code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code # or code-insiders
sudo vim /usr/share/applications/code.desktop -> Enable wayland with --enable-features=UseOzonePlatform --ozone-platform=wayland  

- Change display layout
https://github.com/nwg-piotr/nwg-displays

- Embedded development
sudo dnf install arm-none-eabi-gcc-cs
sudo dnf install openocd
sudo dnf install texlive-scheme-full

- SSH keys
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
ssh-add ~/.ssh/id_rsa

- PIP
python -m pip3 install --upgrade pip

- Terminal
sudo dnf install foot
sudo dnf install zsh
chsh -s $(which zsh)
echo $0 #check shell after rebootf
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Daemons

- Screen temperature
sudo dnf group install c-development development-tools
sudo dnf install wlsunset

- Notification center
sudo dnf copr enable erikreider/SwayNotificationCenter
sudo dnf install SwayNotificationCenterd

- Wallpaper
sudo dnf install hyprpaper

- Volume mixer in waybar
sudo dnf install pamixer

- Screenshots
https://github.com/jtheoof/swappy
sudo dnf install swappy 
Script in ~/.config/hypr + ~/.config/swappy


## Terminal tools
- System infos from terminal
sudo dnf install fastfetch
fastfetch --gen-config

- Ressource monitor from terminal
sudo dnf install btop

## Debug tools

- Check window class
sudo dnf install hyprprop

- Check key name
sudo dnf install wev

## Themes

- Hyprland color theme
https://github.com/dracula/hyprland

- Swaync theme
Theme with https://github.com/catppuccin/swaync

- Icons theme
sudo dnf install papirus-icon-theme

- Use dark theme
Change this line in gtk-3.0 and gtk-4.0 config files
[Settings]
gtk-application-prefer-dark-theme=1

- Loader theme
dnf search plymouth-theme-spinfinity
plymouth-set-default-theme spinfinity
/usr/libexec/plymouth/plymouth-update-initrd

- Modify applications theme globally
sudo dnf install arc-theme
sudo dnf install lxappearance
sudo dnf install gnome-tweaks
https://github.com/nwg-piotr/nwg-look
make build
sudo make install
> Select theme + font + icons in parameters

- Lightdm Settings
sudo dnf instal lightdm-gtk-greeter-settings

## Fonts

- Nerd fonts
sudo dnf copr enable che/nerd-fonts
sudo dnf install nerd-fonts

- Jetbrains font
sudo dnf copr enable elxreno/jetbrains-mono-fonts
sudo dnf install jetbrains-mono-fonts

- Pixel font (Monocraft)
https://github.com/IdreesInc/Monocraft/releases
Move .ttf to ~/.local/share/fonts
fc-cache -fv

- Pixel font (Scientifica)
https://github.com/oppiliappan/scientifica/releases

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
###Install SwayFX
Follow : https://github.com/WillPower3309/swayfx/blob/master/INSTALL-deb.md
sudo dnf install libwayland-server pcre2-devel wayland-protocols-devel json-c-devel
Install waylandf-server : sudo dnf install 'pkgconfig(wayland-server)'
meson setup build from top git dir
Add add_project_arguments('-Wno-error', language: 'c') to the meson file

### Blur
Picom
