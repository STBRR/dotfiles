# dotfiles installation script ~ 11.11.2017
#!/bin/bash
clear
echo "Stabber's Dotfile Script\n"

echo "[*] Updating System & Installing Required Packages"
sudo apt-get -y update
sudo apt-get -y install htop ntpdate rofi i3 lolcat cowsay feh xcompmgr figlet ranger i3blocks >/dev/null 2>&1

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
echo "[*] Tewi Installed"

# download & install font awesome for icons
cd && cd Downloads
wget https://use.fontawesome.com/releases/v5.0.9/fontawesome-free-5.0.9.zip >/dev/null 2>&1
unzip font-awesome* >/dev/null 2>&1
cd font-awe* && cd use-on-desktop*
sudo mkdir /usr/share/fonts/opentype/
sudo cp * /usr/share/fonts/opentype/ >/dev/null 2>&1
sudo rm /etc/fonts/conf.d/70*
sudo fc-cache -f -v >/dev/null 2>&1
echo "[*] Font Awesome Installed!"

# copy config files
cd ~
cd && mkdir .i3
cp dotfiles/i3/config  ~/.i3/
cd && cd dotfiles; cd i3; sudo cp i3blocks.conf /etc/i3blocks.conf
cd && cd dotfiles/bash/; sudo cp bashrc ~/.bashrc
echo "[*] Configurations Installed!"

# clean up & reboot
cd && rm -rf dotfiles/ Desktop/ Documents/ Downloads/ Music/ Pictures/ Public/ Templates/ Videos/; rm examples.desktop
read -p "[!] Installation Successful!"; sudo reboot
