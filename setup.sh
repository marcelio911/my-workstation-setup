#!/bin/sh

sudo apt-get update

# Install necessary packages for Android development
sudo apt-get install -y openjdk-11-jdk android-sdk

wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip

wget https://raw.githubusercontent.com/Shashikant86/vagrant-ansible-appium/master/android.rules


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
    
    sudo cp  ~/.bashrc /root/.bashrc
    unzip commandlinetools-linux-9477386_latest.zip
    sudo \mv cmdline-tools/bin/* $ANDROID_HOME/tools/bin
    sudo \cp android.rules /etc/udev/rule.d/51-android.rules
    
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

    # Accept the Android SDK licenses
    yes | sudo sdkmanager --sdk_root=$ANDROID_HOME --licenses

    # Install additional Android packages
    sudo sdkmanager --sdk_root=$ANDROID_HOME "platforms;android-31" "build-tools;31.0.0"  # Customize as needed

    # Install any other necessary packages and dependencies
    # ...
    sudo apt install net-tools
    sudo apt install glances 
    sudo apt install zsh 
