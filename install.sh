#!/bin/bash

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# Create config directories
mkdir -p ~/.config/{alacritty,i3,i3blocks,rofi,dunst}
mkdir -p ~/.themes
mkdir -p ~/.icons

# Symlink configs
ln -sf $DOTFILES/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf $DOTFILES/i3.config ~/.config/i3/config
ln -sf $DOTFILES/i3blocks.config ~/.config/i3blocks.conf
ln -sf $DOTFILES/gruvbox.rasi ~/.config/rofi/gruvbox.rasi
ln -sf $DOTFILES/rofi.config.rasi ~/.config/rofi/config.rasi
ln -sf $DOTFILES/dunstrc ~/.config/dunst/dunstrc
ln -sf $DOTFILES/.zshrc ~/.zshrc

echo "Installing GTK theme..."
cd ~/.themes
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git
cd Gruvbox-GTK-Theme
./install.sh
cp -r icons/* ~/.icons/

echo "Installing dependencies..."
sudo apt install -y \
    alacritty \
    rofi \
    dunst \
    vivid \
    lxappearance \
    i3blocks \
    feh

echo "Done! Reload i3 with mod+shift+r"
