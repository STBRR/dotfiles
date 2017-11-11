# dotfiles installation script ~ 11.11.2017
#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install htop ntpdate rofi i3 lolcat cowsay feh xcompmgr figlet ranger i3blocks pavucontrol pasystray >/dev/null 2>&1

# remove current timezone + set up system date time for uk time
sudo rm /etc/localtime
sudo cp /usr/share/zoneinfo/Europe/London /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/London /etc/localtime

# download & install tewi font
git clone https://www.github.com/lucy/tewi-font.git >/dev/null 2>&1
cd tewi-font
make >/dev/null 2>&1
cd out/
sudo cp * /usr/share/fonts/ >/dev/null 2>&1
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo fc-cache -f -v >/dev/null 2>&1
echo "[1/6] Tewi Installed"

# download & install i3
cd; git clone https://www.github.com/Airblader/i3 i3-gaps >/dev/null 2>&1
cd i3-gaps
sudo apt-get -y install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf >/dev/null 2>&1
autoreconf --force --install >/dev/null 2>&1
rm -rf build/
mkdir -p build && cd build/ 
cd && cd Download/
wget https://launchpad.net/ubuntu/+archive/primary/+files/libxcb-xrm-dev_1.0-1_amd64.deb >/dev/null 2>&1
wget https://launchpad.net/ubuntu/+archive/primary/+files/libxcb-xrm0_1.0-1_amd64.deb >/dev/null 2>&1
sudo dpkg -i libxcb-xrm0* >/dev/null 2>&1
sudo dpkg -i libxcb-xrm-de* >/dev/null 2>&1
sudo rm libxcb*
cd && cd i3-gaps/build/
../configure --prefix=/usr --sysconfdir=/etc >/dev/null 2>&1
make && sudo make install >/dev/null 2>&1
echo "[2/6] i3 Installed"

# download & install font awesome for icons
cd && cd Downloads
wget http://fontawesome.io/assets/font-awesome-4.7.0.zip >/dev/null 2>&1
unzip font-awesome* >/dev/null 2>&1
cd font-awe*
cd fonts*
sudo cp * /usr/share/fonts >/dev/null 2>&1
sudo rm /etc/fonts/conf.d/70*
sudo fc-cache -f -v >/dev/null 2>&1
echo "[3/6] Font Awesome Installed!"

# copy config files
cd && mkdir .i3
cd dotfiles/i3/
cp config ~/.i3/
echo "[4/6] i3 Config Copied"

cd && cd dotfiles; cd i3; sudo cp i3blocks.conf /etc/i3blocks.conf
echo "[5/6] i3 Blocks Config Copied"

cd && cd dotfiles/bash/; sudo cp bashrc ~/.bashrc
echo "[6/6] Installation Sucessful!"

# clean up & reboot
cd && rm -rf dotfiles/ Desktop/ Documents/ Downloads/ i3-gaps Music/ Pictures/ Public/ Templates/ Videos/; rm examples.desktop
read -p "[ENTER] to reboot!"; sudo reboot
