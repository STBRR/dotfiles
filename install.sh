#!/bin/bash
echo "Dotfile Installation"

echo "..[1/6] - Updating Packages"
sudo apt -y update >/dev/null 2>&1
echo "..success"

echo "..[2/6] - Installing Packages"
sudo cat packages.list | xargs -I {} sudo apt install -y {} 
echo "..success"

echo "..[3/6] - Installing PyWal"
sudo pip3 install pywal
echo "..success"

# Install SublimeText
echo "[4/6] - Installing Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt -y update
sudo apt -y install sublime-text
echo "..success"

# Install oh-my-zsh and set main shell to zsh on startup
echo "[5/6] - Installing oh-my-zsh"
echo "..current shell: $(echo $SHELL)"
echo "..zsh Version: $(zsh --version)"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null 2>&1
echo "..success"

# Copy i3 config
echo "[6/6] Copying Configuration Files"

# Copy zsh config
rm ~/.zshrc; cp configs/zshrc ~/.zshrc

# Copy i3 config
sudo rm ~/.config/i3/config; cp configs/i3main ~/.config/i3/config
sudo cp configs/i3blocks /etc/i3blocks.conf

# Copy tmux config
cp configs/tmux ~/.tmux.conf

# Copy over sublime-text config
cd ~/.config/; mkdir sublime-text-3; cd sublime-text-3; mkdir Packages; cd Packages; mkdir User; cd; cd dotfiles
sudo cp configs/sublime ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

# Generate SSH keys
echo "\nGenerating SSH Keys!"
ssh-keygen

chsh -s $(which zsh)
echo "Installation Finished, Press Return to reboot"
sudo reboot
