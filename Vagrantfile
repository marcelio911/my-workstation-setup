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
    
  SHELL


	end

    # Install any other necessary packages and dependencies
    # ...
 
end
