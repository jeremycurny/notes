#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Start
echo "001_packages.sh start"

# Update
echo "Apt-get update"
apt-get update

# Common
echo "Common"
apt-get install -y linux-headers-$(uname -r)
apt-get install -y autoconf automake build-essential gcc libtool make
apt-get install -y curl fail2ban htop iftop iotop telnet zip
apt-get install -y debconf-utils
apt-get install -y python-pip python-software-properties software-properties-common
apt-get install -y libcurl4-openssl-dev zlib1g-dev

# Apache
echo "Apache"
apt-get install -y apache2 openssl

# Git
echo "Installing Git"
apt-get install -y git git-flow

# Mysql
echo "Installing Mysql Server"
debconf-set-selections <<< "mysql-server mysql-server/root_password password t00r"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password t00r"
apt-get install -y mysql-client mysql-server

# NodeJS / NPM
echo "NodeJS / NPM"
curl -sL https://deb.nodesource.com/setup_4.x | bash && apt-get install -y nodejs

# PHP
echo "PHP"
apt-get install -y php5
apt-get install -y php-apc php5-cli php5-curl php5-dev php5-gd php5-imap php5-intl php5-mcrypt php5-xdebug
apt-get install -y php5-mysql php5-sqlite

## Other - Geoip
echo "Geoip"
apt-get install -y geoip-bin geoip-database libgeoip-dev libgeoip1
apt-get install -y libapache2-mod-geoip php5-geoip

## Other - PHP Phalcon
echo "PHP Phalcon"
curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash
apt-get install -y php5-phalcon

# End
echo "001_packages.sh end"
