# Apache

## Initialization

```
rm -f /var/www/html/index.html
rm -f /etc/apache2/sites-available/default-ssl.conf
mkdir -p /var/www/html/vhosts
mkdir -p /var/www/html/vhosts/default
echo 'Deny from all' > /var/www/html/.htaccess
echo 'Deny from all' > /var/www/html/vhosts/.htaccess
echo '<!-- default -->' > /var/www/html/vhosts/default/index.html
chown -R root:www-data /var/www/html
find /var/www/html -type d -exec chmod 2770 {} \;
find /var/www/html -type f -exec chmod 0660 {} \;
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

                ErrorLog ${APACHE_LOG_DIR}/default.error.log
                CustomLog ${APACHE_LOG_DIR}/default.access.log combined

                SSLEngine on

                SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
                SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key

                <FilesMatch "\.(cgi|shtml|phtml|php)$">
                        SSLOptions +StdEnvVars
                </FilesMatch>
                <Directory /usr/lib/cgi-bin>
                        SSLOptions +StdEnvVars
                </Directory>

                BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
                
                ErrorLog ${APACHE_LOG_DIR}/default.error.log
                CustomLog ${APACHE_LOG_DIR}/default.access.log combined
        </VirtualHost>
</IfModule>
EOF
service apache2 restart
```

## Directives

### AddDefaultCharset

Response charset

```
AddDefaultCharset utf-8
```

### AllowOverride

Directives allowed in .htaccess

```
AllowOverride All
AllowOverride None
AllowOverride FileInfo
AllowOverride FileInfo Indexes Options
```

### Options

Features available in a particular directory
*The FollowSymLinks and SymLinksIfOwnerMatch Options work only in **<Directory>** sections or .htaccess files.*

```
Options Indexes FollowSymLinks
Options +Indexes -FollowSymLinks
```

#### All

All options except for MultiViews. This is the default setting.

#### FollowSymLinks

#### Indexes

Return a formatted listing of the directory if no DirectoryIndex (default : index.html, index.php...).

#### MultiViews

#### SymLinksIfOwnerMatch
