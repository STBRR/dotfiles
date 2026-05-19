#!/bin/bash

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# Create config directories
mkdir -p ~/.config/{alacritty,i3,i3blocks,rofi,dunst}
mkdir -p ~/.themes
mkdir -p ~/.icons

# Wallpaper
mkdir -p ~/Pictures
cp $DOTFILES/wallpaper/spacemars-blur.png ~/Pictures/spacemars-blur.png

# Font
cp $DOTFILES/font/IoskeleyMono-NerdFont-Normal.zip /tmp/font.zip
cd /tmp
unzip font.zip -d font-install
cd font-install/
sudo cp *.ttf /usr/share/fonts
sudo fc-cache -f -v
rm /tmp/font-install /tmp/font.zip

# Helper Scripts
mkdir -p ~/Documents
cp $DOTFILES/helpers/fix_history.sh ~/Documents/fix_history.sh
cp $DOTFILES/helpers/vm.sh ~/Documents/vm.sh

# Symlink configs
ln -sf $DOTFILES/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf $DOTFILES/i3.config ~/.config/i3/config
ln -sf $DOTFILES/i3blocks.config ~/.config/i3blocks.conf
ln -sf $DOTFILES/gruvbox.rasi ~/.config/rofi/gruvbox.rasi
ln -sf $DOTFILES/rofi.config.rasi ~/.config/rofi/config.rasi
ln -sf $DOTFILES/dunstrc ~/.config/dunst/dunstrc
ln -sf $DOTFILES/.zshrc ~/.zshrc

<<<<<<< HEAD
# Fix nerd font
sed -i 's/Ioskeley Mono/IoskeleyMono Nerd Font/g' ~/.config/alacritty/alacritty.toml
=======
echo "Installig i3Blocks + Config"
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks/contrib
cd ~/.config/i3blocks/contrib
./configure && make && sudo make install

sudo cp $DOTFILES/i3blocks.config /etc/i3blocks.conf
>>>>>>> 11fd9b7 (fix: i3blocks contrib compile and copying)

echo "Installing GTK theme..."
cd ~/.themes
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git
cd Gruvbox-GTK-Theme
cd themes
./install.sh
cd ..
cp -r icons/* ~/.icons/

echo "Updating Packages..."
sudo apt -y update

echo "Installing dependencies..."
sudo apt install -y \
    alacritty \
    rofi \
    dunst \
    vivid \
    lxappearance \
    i3 \
    vivid \
    i3blocks \
    feh \
    imwheel \
    lsd \
    bat \
    zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" & 
cp $DOTFILES/.zsh ~/.zshrc



echo "Done! Reload i3 with mod+shift+r"
