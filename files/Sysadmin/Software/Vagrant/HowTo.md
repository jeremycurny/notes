# Vagrant how to

## Summary

- **vagrant up** : Install the VM
- **vagrant ssh** : SSH connection to the VM
- **vagrant halt** : Shutdown the VM
- **vagrant provision** : Run provision on the VM
- **vagrant destroy** : Destroy the VM

## Example of virtual machine

### Vagrant folder

Create a folder "Vagrant" like this :

#### Architecture

```
Vagrant/
    │   provisioner.sh
    └───Vagrantfile
```

#### Vagrantfile file

```ruby
Vagrant.configure("2") do |config|
  # Virtual machine
  config.vm.box = "hashicorp/precise64"

  # Shell provisioner
  config.vm.provision "shell", path: "provisioner.sh"
end
```

#### provisioner.sh file

```bash
#!/bin/sh

# Start
echo "provisioner.sh start"

# Update
echo "Apt-get update"
apt-get update

# Common
echo "Common"
apt-get install -y linux-headers-$(uname -r)
apt-get install -y autoconf automake build-essential gcc make
apt-get install -y curl htop

# Apache
echo "Apache"
apt-get install -y apache2 openssl
a2enmod deflate expires headers rewrite ssl

# Post install
echo "Post install"
service apache2 restart

# End
echo "provisioner.sh end"
```

### Launch and co

In this folder, type this in terminal :

```
vagrant up
vagrant ssh
```

### Try apache

```
apache -v
```
