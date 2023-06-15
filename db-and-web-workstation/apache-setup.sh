#!/bin/sh

#sudo apt update -y
   
# Install necessary packages for Android development
sudo apt install -y  net-tools glances zsh  git

ifconfig

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install -y apache2
  
   mkdir -p ~/Developing/dracula-theme/
   cd ~/Developing/dracula-theme/
   git clone https://github.com/dracula/gnome-terminal
   cd gnome-terminal
    ./install.sh
   
   