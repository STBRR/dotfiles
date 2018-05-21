#!/bin/bash
echo "Stabber's Dotfile Script\n"
echo "] Installing Packages"
sudo apt-get -y update >/dev/null 2>&1
sudo apt-get -y install htop ntpdate rofi i3 lolcat cowsay feh xcompmgr figlet ranger i3blocks fonts-font-awesome >/dev/null 2>&1

# install tewi-font from github
git clone https://www.github.com/lucy/tewi-font.git >/dev/null 2>&1
cd tewi-font
make >/dev/null 2>&1
cd out/
sudo cp * /usr/share/fonts/ >/dev/null 2>&1
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf >/dev/null 2>&1
sudo fc-cache -f -v >/dev/null 2>&1

# copy config files
echo "] Copying Config Files"
cd ~
cd && mkdir .i3
cp dotfiles/i3/config  ~/.i3/
cd && cd dotfiles; cd i3; sudo cp i3blocks.conf /etc/i3blocks.conf
cd && cd dotfiles/bash/; sudo cp bashrc ~/.bashrc

# clean up & reboot
cd && rm -rf dotfiles/ Desktop/ Documents/ Downloads/ Music/ Pictures/ Public/ Templates/ Videos/; rm examples.desktop
read -p "] Installation Successful!"; sudo reboot
