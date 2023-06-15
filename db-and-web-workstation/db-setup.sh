#!/bin/sh

#sudo apt update -y
   
# Install necessary packages for Android development
sudo apt install -y  net-tools glances zsh git

ifconfig

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install -y mongodb mysql
  
   mkdir -p ~/dracula-theme/
   cd ~/dracula-theme/
   git clone https://github.com/dracula/gnome-terminal
   cd gnome-terminal
    ./install.sh

   
   