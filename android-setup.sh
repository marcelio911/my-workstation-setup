#!/bin/sh

#sudo apt update -y
   
# Install necessary packages for Android development
sudo apt install -y  net-tools glances zsh  dconf-cli git

ifconfig

sudo apt install -y openjdk-11-jdk android-sdk

wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip

wget https://raw.githubusercontent.com/Shashikant86/vagrant-ansible-appium/master/android.rules

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -

sudo apt install -y nodejs yarn npm


 # Set environment variables
   echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
   echo 'export ANDROID_HOME=/usr/lib/android-sdk' >> ~/.bashrc
   echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
   echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
   echo 'export ADB=$ANDROID_HOME/platform-tools/adb' >> ~/.bashrc
   echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bashrc
   echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
   echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools' >> ~/.bashrc
   echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.bashrc
   echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc
   echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools/systrace' >> ~/.bashrc
   
   source ~/.bashrc
   sudo cp  ~/.bashrc /root/.bashrc
   sudo su -c "source /root/.bashrc"
   
   unzip commandlinetools-linux-9477386_latest.zip
   sudo \mv cmdline-tools/bin/* $ANDROID_HOME/tools/bin
   sudo \cp android.rules /etc/udev/rules.d/51-android.rules
   
   echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

   # Accept the Android SDK licenses
   echo yes | sudo sdkmanager --sdk_root=$ANDROID_HOME --licenses

   # Install additional Android packages
   sudo sdkmanager --sdk_root=$ANDROID_HOME "platforms;android-31" "build-tools;31.0.0"  # Customize as needed

   mkdir -p ~/Developing/dracula-theme/
   cd ~/Developing/dracula-theme/
   git clone https://github.com/dracula/gnome-terminal
   cd gnome-terminal
    ./install.sh

   # Install any other necessary packages and dependencies
   # ...
  sudo npm install -g npm@9.7.1

   
   