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

# NodeJS / NPM
echo "NodeJS / NPM"
curl -sL https://deb.nodesource.com/setup_4.x | bash
apt-get install -y nodejs

# PHP
echo "PHP"
apt-get install -y php5 php-apc php5-curl php5-gd php5-imap php5-intl php5-mcrypt php5-mysql php5-xdebug
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer

# Post install
echo "Post install"
service apache2 restart

# End
echo "provisioner.sh end"
