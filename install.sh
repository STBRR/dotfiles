#!/bin/bash

# Update the system
sudo apt-get update

# Download required packages
sudo apt-get install htop cmatrix tor tor-arm rofi i3 lolcat cowsay feh xcompmgr figlet vim ranger i3blocks pavucontrol pasyst

# Download tewi-font and install
git clone https://www.github.com/lucy/tewi-font.git
cd tewi-font
make
cd out/
sudo cp * /usr/share/fonts/

# Installing the font
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo fc-cache -f -v

echo "[1/9] Tewi has been installed"

# Download i3-gaps
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# Install dependencies for i3-gaps
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf

# Compile and install i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Download xcb-packages
cd && cd Download/
wget https://launchpad.net/ubuntu/+archive/primary/+files/libxcb-xrm-dev_1.0-1_amd64.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/libxcb-xrm0_1.0-1_amd64.deb

# Install xcb-packages
sudo dpkg -i libxcb-xrm0*
sudo dpkg -i libxcb-xrm-de*

# Back to i3-gaps installation
cd i3-gaps
cd build/
../configure --prefix=/usr --sysconfdir=/etc
make && sudo make install

echo "[2/9] i3-gaps has been installed"

# Install font-awesome framework, Icons for i3blocks
cd && cd Downloads
wget http://fontawesome.io/assets/font-awesome-4.7.0.zip
unzip font-awesome*
cd font-awe*
cd fonts*
sudo cp * /usr/share/fonts
sudo rm /etc/fonts/conf.d/70*

# Update font cache just to make sure we're installed
sudo fc-cache -f -v

echo "[3/9] Font-awesome framework installed"

# Copy over configs from dotfiles repo
cd && mkdir .i3
cd dotfiles/i3/
cp config ~/.i3/

echo "[4/9] i3 configuration copied"

# Copy over i3 blocks config
cd && cd dotfiles
cd i3
sudo cp i3blocks.conf /etc/i3blocks.conf

echo "[5/9] i3-blocks configuaration copied"

# bashrc
cd && cd dotfiles/bash/
sudo cp bashrc ~/.bashrc

echo "[6/9] bashrc copied!"

# Update the system to make sure everything is complete
echo "[7/10] Updating system"
sudo apt-get update


echo "[8/9] System updated"
echo "[9/9] Rebooting..."
sudo reboot
