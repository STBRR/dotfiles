#!/bin/bash
# Updated: 17-06-2019 19:43
echo "Liam's dotfile Installation"

echo "Installing Required Packages & Updating"
# Update the system and install required packages from package manager.
sudo apt -y update >/dev/null 2>&1
sudo apt -y install htop zsh ntpdate rofi i3 lolcat cowsay feh xcompmgr figlet ranger i3blocks fonts-font-awesome thunar lxappearance gtk-chtheme qt4-qtconfig>/dev/null 2>&1
echo "..success"

echo "Installing PyWal"
# Install pywal
sudo pip3 install pywal > /dev/null 2>&1
echo "..success"

# Install SublimeText
echo "Installing Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt -y install apt-transport-https > /dev/null 2>&1
sudo apt -y update > /dev/null 2>&1
sudo apt -y install sublime-text
echo "..success"

# Install Tamsyn Font
echo "Installing Tamsyn Font"
wget "http://www.fial.com/~scott/tamsyn-font/download/tamsyn-font-1.11.tar.gz" -O /tmp/tamsyn-font.tar.gz > /dev/null 2>&1
gunzip /tmp/t*.gz
tar xvf t*.tar && cd tam*; sudo cp *.pcf /usr/share/fonts
sudo rm /etc/fonts/conf.d/70-no*
sudo fc-cache -f -v > /dev/null 2>&1
echo "..success"

# Install oh-my-zsh and set main shell to zsh on startup
echo "Installing oh-my-zsh"
echo "..current shell: $(echo $SHELL)"
echo "..zsh Version: $(zsh --version)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" > /dev/null 2>&1
chsh -s $(which zsh)
echo "..success"

# Copy i3 configuration
echo "Copying Configuration Files"
rm ~/.config/i3/config && cp ~/dotfiles/i3/config ~/.config/i3/config
sudo cp ~/dotfiles/i3/i3blocks.conf /etc/i3blocks.conf

# Copy zsh configuration
rm ~/.zshrc; cp ~/dotfiles/zsh/zshrc ~/.zshrc

# Copy tmux configuration
cp ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
echo "..success"

echo "Installation Finished, Please reboot to finish setup."
