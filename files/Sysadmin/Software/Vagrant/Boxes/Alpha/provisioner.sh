#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Start
echo "provisioner.sh start"

# Update
echo "Apt-get update"
apt-get update

# Common
echo "Common"
apt-get install -y linux-headers-$(uname -r)
apt-get install -y autoconf automake build-essential gcc libtool make
apt-get install -y curl fail2ban htop iftop iotop telnet
apt-get install -y debconf-utils
apt-get install -y python-software-properties software-properties-common
apt-get install -y libcurl4-openssl-dev zlib1g-dev

# Apache
echo "Apache"
apt-get install -y apache2 openssl
a2enmod deflate expires headers rewrite ssl

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

# Apache configure
echo "Apache configure"
rm -f /var/www/index.html
rm -f /var/www/html/index.html
rm -f /etc/apache2/sites-enabled/*
rm -f /etc/apache2/sites-available/*
mkdir -p /var/www/html/vhosts
mkdir -p /var/www/html/vhosts/default
echo 'Deny from all' > /var/www/html/.htaccess
echo 'Deny from all' > /var/www/html/vhosts/.htaccess
echo 'Allow from all' > /var/www/html/vhosts/default/.htaccess
echo 'Default Vhost' > /var/www/html/vhosts/default/index.html
cat <<EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost _default_:80>
  ServerName default:80
  DocumentRoot /var/www/html/vhosts/default
  ErrorLog ${APACHE_LOG_DIR}/default.error.log
  CustomLog ${APACHE_LOG_DIR}/default.access.log combined
</VirtualHost>
<IfModule mod_ssl.c>
  <VirtualHost _default_:443>
    ServerName default:80
    DocumentRoot /var/www/html/vhosts/default
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
    <FilesMatch "\.(shtml|phtml|php)$">
      SSLOptions +StdEnvVars
    </FilesMatch>
    BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
    ErrorLog ${APACHE_LOG_DIR}/default.error.log
    CustomLog ${APACHE_LOG_DIR}/default.access.log combined
  </VirtualHost>
</IfModule>
EOF
a2ensite 000-default.conf

# Other

## Other - Adminer
echo "Adminer"
mkdir -p /var/www/html/vhosts/default/adminer
curl -o /var/www/html/vhosts/default/adminer/index.php http://www.adminer.org/static/download/4.2.5/adminer-4.2.5-en.php

## Other - Composer
echo "Composer"
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer

## Other - Geoip
echo "Geoip"
apt-get install -y geoip-bin geoip-database libgeoip-dev libgeoip1
apt-get install -y libapache2-mod-geoip php5-geoip
cat <<EOF > /etc/apache2/mods-available/geoip.conf
<IfModule mod_geoip.c>
  GeoIPEnable On
  GeoIPOutput All
  GeoIPDBFile /usr/share/GeoIP/GeoIP.dat
</IfModule>
EOF

## Other - Infos
echo "Infos"
mkdir -p /var/www/html/vhosts/default/infos
cat <<EOF > /var/www/html/vhosts/default/infos/index.php
<?php
  phpinfo();
EOF

## Other - PHP Phalcon
echo "PHP Phalcon"
curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash
apt-get install -y php5-phalcon
echo 'extension=phalcon.so' > /etc/php5/mods-available/phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/cli/conf.d/phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/apache/conf.d/phalcon.ini

# Post install
echo "Post install"
service apache2 restart
service mysql restart

# End
echo "provisioner.sh end"
