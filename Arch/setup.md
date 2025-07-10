# Install
## Install Distro Archlinux + Hyprland
    - Follow https://www.youtube.com/watch?v=WaWB3F-ffcI
    - Choose hyprland for Window manager
    - Choose ly for logging manager

## Install Yay package manager
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

## Install Packages
    sudo pacman -S arm-none-eabi-gcc openocd plocate hyprlock hypridle slurp grim imagemagick swappy wl-clipboard hyprpaper imagemagick file gnome-keyring libsecret nwg-look qt5ct qt6ct kvantum tar python-pywal ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono gnome-font-viewer tuned-ppd network-manager-applet gnome-icon-theme hicolor-icon-theme xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland blueman bluez bluez-utils xdg-user-dirs thunar-volman gvfs udisks2 gnome-disk-utility deluge qt5-wayland qt6-wayland neovim tmux
  
    yay -S zen-browser-bin visual-studio-code-bin hyprpicker xdg-desktop-portal-hyprland polkit polkit-gnome bibata-cursor-theme j7z ttf-meslo-nerd-font-powerlevel10k hyprprop


### Following commands
    ```
    sudo updatedb # for plocate

    # For keyring, edit /etc/pam.d/login with:
    #   auth optional pam_gnome_keyring.so 
    #   session optional pam_gnome_keyring.so auto_start

    git clone https://github.com/gaurav23b/simple-hyprland ~/Downloads # for theme selection in ngwlook
    tar -xvf ~/Downloads/simple-hyprland/assets/themes/Catppuccin-Mocha.tar.xz -C usr/share/themes/

    eval `ssh-agent -s` # For SSH keys, after moving the keys to .ssh folder
    sudo chmod 600 ~/.ssh/id_ed25519
    sudo chmod 600 ~/.ssh/id_ed25519.pub
    ssh-add ~/.ssh/id_ed25519

    wal -i ~/.config/hypr/background.png    # For theming
    wal -i ~/.config/hypr/background.png -o ./wal-set

    sudo visudo # For power profiles for laptop
    simon ALL=(ALL) NOPASSWD: /usr/bin/tuned-adm

    sudo systemctl enable --now bluetooth.service # For bluetooth

    sudo usermod -aG storage $USER # For removable drives
    # Thunar > Edit > Preferences > Advanced > Configure > Mount removable drives when hotplugged

    chsh -s /usr/bin/zsh #ZSH config
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

    git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

    # Imports the SESSION folders (.config, .script, .cache,...)
    ```

## List of tools installed
- Openocd
- Zen browser
- VSCode
- plocate
- hyprlock
- hypridle
- Screenshots tools
- Wallpaper tools
- Color selection
- Screensharing
- Polkit
- Keyring
- Cursor (bibata)
- Theming (Catppuccin-Mocha)
- Archives manager
- SSH keys
- Theming
- Fonts
- Power profiles
- Icons
- Workspaces
- Bluetooth
- Disks manager
- ZSH
- Torrent client (deluge)
- Neovim (https://github.com/neovim/neovim/blob/master/INSTALL.md)
- Tmux

# Usefull commands
- List monitors
    hyprctl monitors
- Change wallpaper
    cd ~/.scripts & ./change-wall.sh <image-file>
- Remove package
    sudo pacman -Runs <package>
- Update system
    sudo pacman -Syy
    sudo pacman -Syu
- List installed fonts
    fc-list | grep -i something...

# Style inspired from https://github.com/Hudson-Liu/Dotfiles
