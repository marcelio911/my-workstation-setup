# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "base"
  # config.vm.box = "ubuntu/focal64"  # Choose an appropriate base box for your VM
  
  # config.vm.define "db" do |db|
	# 	db.vm.box = "mysql"
	# end

  config.vm.define "workstation" do |workstation|
		workstation.vm.box = "fasmat/ubuntu2204-desktop"
    workstation.vm.box_version = "22.0509.1"
    # workstation.vm.box = "ubuntu/focal64"  # Choose an appropriate base box for your VM
    workstation.vm.hostname = "android-workstation"
    workstation.vm.box_check_update = true
    workstation.vm.synced_folder "./data", "/vagrant_data", type: "virtualbox", create: true

    workstation.vm.network "private_network", ip: "192.168.50.155", bridge: "wlp0s20f3"

    # SSH configuration
    workstation.ssh.username = "vagrant"
    workstation.ssh.password = "vagrant"
    workstation.ssh.private_key_path = "~/.ssh/id_rsa"
    workstation.ssh.insert_key = true
    workstation.ssh.host = "192.168.0.32"
    workstation.ssh.guest_port = 22
    workstation.ssh.extra_args = "-o StrictHostKeyChecking=no"
    workstation.ssh.keep_alive = true
    workstation.ssh.keys_only = true
    workstation.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", auto_correct: true
    workstation.ssh.forward_agent = false
    workstation.ssh.dsa_authentication = false
    
    workstation.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.memory = 4096  # Set the desired memory for the VM
      vb.cpus = 2      # Set the desired number of CPUs for the VM
      vb.customize ["modifyvm", :id, "--nic1", "bridged"]
      vb.customize ["modifyvm", :id, "--bridgeadapter1", "wlp0s20f3"]

    end

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "initial_setup.yml"
    end
   
    workstation.vm.provision "shell", inline: <<-SHELL
    # Update the package repositories
    ~/setup.sh
  SHELL


	end

  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
 

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.50.155", bridge: "wlp0s20f3"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "./data", "/vagrant_data", type: "virtualbox", create: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  # config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true
  #   vb.memory = 6144  # Set the desired memory for the VM
  #   vb.cpus = 4      # Set the desired number of CPUs for the VM
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # config.vm.provision "ansible" do |ansible|
  #   ansible.playbook = "./initial_setup_playbook.yml"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   # Update the package repositories
  #   sudo apt-get update

  #   # Install necessary packages for Android development
  #   sudo apt-get install -y openjdk-11-jdk android-sdk

  #   wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip

  #   wget https://raw.githubusercontent.com/Shashikant86/vagrant-ansible-appium/master/android.rules

  #   # Set environment variables
  #   echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
  #   echo 'export ANDROID_HOME=/usr/lib/android-sdk' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
  #   echo 'export ADB=$ANDROID_HOME/platform-tools/adb' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc
  #   echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools/systrace' >> ~/.bashrc
    
  #   sudo cp  ~/.bashrc /root/.bashrc
  #   unzip commandlinetools-linux-9477386_latest.zip
  #   sudo \mv cmdline-tools/bin/* $ANDROID_HOME/tools/bin
  #   sudo \cp android.rules /etc/udev/rule.d/51-android.rules

  #   # Accept the Android SDK licenses
  #   yes | sudo sdkmanager --sdk_root=$ANDROID_HOME --licenses

  #   # Install additional Android packages
  #   sudo sdkmanager --sdk_root=$ANDROID_HOME "platforms;android-31" "build-tools;31.0.0"  # Customize as needed

  #   # Install any other necessary packages and dependencies
  #   # ...

  # SHELL

 
end
