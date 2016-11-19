#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Start
echo "provisioner.sh start"
echo "build"

# Update
echo "Apt-get update"
apt-get update

# Common
echo "Common"
apt-get install -y linux-headers-$(uname -r)
apt-get install -y autoconf automake build-essential gcc make
apt-get install -y debconf-utils
apt-get install -y python-software-properties software-properties-common
apt-get install -y curl htop mysql

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
apt-get install -y mysql-server

# NodeJS / NPM
echo "NodeJS / NPM"
curl -sL https://deb.nodesource.com/setup_4.x | bash
apt-get install -y nodejs

# PHP
echo "PHP"
apt-get install -y php5 php-apc php5-curl php5-gd php5-imap php5-intl php5-mcrypt php5-mysql php5-xdebug
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar
chmod +x /usr/local/bin/composer

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
echo "Other"
mkdir -p /var/www/html/vhosts/default/adminer
curl -o /var/www/html/vhosts/default/adminer/index.php http://www.adminer.org/static/download/4.2.5/adminer-4.2.5-en.php

# Post install
echo "Post install"
service apache2 restart

# End
echo "provisioner.sh end"
