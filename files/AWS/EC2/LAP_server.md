# Installing a LAP server on EC2 instance
Linux, Apache, PHP on AWS EC2

## Initialization

```
sudo yum update -y
```

## Httpd

### Installation, start and start on system boot
```
sudo yum install -y httpd24 mod24_ssl
sudo chkconfig httpd on
sudo service httpd start
```

### Group www and modify permissions
```
sudo groupadd www
sudo usermod -a -G www ec2-user
sudo chown -R root:www /var/www/html
sudo chmod 2775 /var/www/html
sudo find /var/www -type d -exec chmod 2775 {} \;
sudo find /var/www -type f -exec chmod 0664 {} \;
```

### Deleting Amazon demo files
```
sudo rm /etc/httpd/conf.d/autoindex.conf
sudo rm /etc/httpd/conf.d/welcome.conf
```

### Vhosts
```
mkdir /var/www/html/vhosts
```

#### default Vhost
```
mkdir /var/www/html/vhosts/default
echo "default vhost" > /var/www/html/vhosts/default/index.html
sudo nano /etc/httpd/conf.d/000_default.conf
```

```
<VirtualHost *:80>
  ServerName default:80
  DocumentRoot /var/www/html/vhosts/default
</VirtualHost>

<VirtualHost *:443>
  ServerName default:443
  DocumentRoot /var/www/html/vhosts/default

  SSLEngine on
  SSLCertificateFile /etc/pki/tls/certs/localhost.crt
  SSLCertificateKeyFile /etc/pki/tls/private/localhost.key

  <FilesMatch "\.(php)$">
    SSLOptions +StdEnvVars
  </FilesMatch>

  BrowserMatch "MSIE [2-6]" \
    nokeepalive ssl-unclean-shutdown \
    downgrade-1.0 force-response-1.0
  BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
</VirtualHost>
```

#### example.com Vhost
```
mkdir /var/www/html/vhosts/example.com
echo "example.com vhost" > /var/www/html/vhosts/example.com/index.html
sudo nano /etc/httpd/conf.d/001_example.com.conf
```

```
<VirtualHost *:80>
  ServerName example.com
  ServerAlias www.example.com
  DocumentRoot /var/www/html/vhosts/example.com
  <Directory /var/www/html/vhosts/example.com>
    AllowOverride All
  </Directory>
</VirtualHost>
```

### Restarting httpd
```
sudo service httpd restart
```

### Testing
- Acces with IP or public DSN => "default vhost"
- Acces with hosts modified (example.com and www.example.com to the EC2 IP) => "example.com vhost"

## PHP
```
sudo yum install -y php56
sudo yum install -y php56-gd php56-mysqlnd
```
