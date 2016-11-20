#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Start
echo "002_configure.sh start"

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
a2enmod deflate expires headers rewrite ssl
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

## Other - Geoip
echo "Geoip"
cat <<EOF > /etc/apache2/mods-available/geoip.conf
<IfModule mod_geoip.c>
  GeoIPEnable On
  GeoIPOutput All
  GeoIPDBFile /usr/share/GeoIP/GeoIP.dat
</IfModule>
EOF

## Other - PHP Phalcon
echo "PHP Phalcon"
echo 'extension=phalcon.so' > /etc/php5/mods-available/phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/cli/conf.d/phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/apache/conf.d/phalcon.ini

# End
echo "002_configure.sh end"
