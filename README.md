# Automate your local machine for workstation setup ANDROID


## Install Vagrant depencies into Ubuntu Linux
```
 sudo apt install virtualbox vagrant -y
```

### optional plugins setup
```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-hostmanager

```

#### Setup up (localVM)
```
vagrant up
```

#### Connect your-workstation
```
vagrant ssh
```
#### Enable vbox network EnableStaticIPConfig
```
sudo mkdir /etc/vbox/
echo "* 0.0.0.0/0 ::/0" > /etc/vbox/networks.conf
cat /etc/vbox/networks.conf
```

#### Add permissions to use USB device into Virtualbox
```
sudo usermod -a -G vboxusers $USER
reboot
```

#### After return reboot view list devices connected
```
VBoxManage list usbhost
```
##### How to enable PORT in VM 

- Use right/down statusbar into USB icon choice a list and check your device to preparing

