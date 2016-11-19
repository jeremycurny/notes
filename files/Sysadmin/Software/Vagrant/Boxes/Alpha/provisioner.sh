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

# Git
echo "Installing Git"
apt-get install -y git git-flow

# Post install
echo "Post install"
service apache2 restart

# End
echo "provisioner.sh end"
