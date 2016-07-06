# Installing a LAP server (Linux, Apache, PHP) on EC2 instance and Vhosts

## Initialization

### Packages

#### Mandatory
```
sudo yum update -y
sudo yum install -y httpd24 php56
```

#### Optional
```
sudo yum install -y php56-mysqlnd
```

### Httpd start and start on system boot
```
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

### Deleting amazon demo files
```
sudo rm /etc/httpd/conf.d/autoindex.conf
sudo rm /etc/httpd/conf.d/welcome.conf
```

## Vhosts
```
mkdir /var/www/html/vhosts
```

### default Vhost
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
```

```
sudo service httpd reload
```

### example.com Vhost
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

## Restarting httpd
```
sudo service httpd restart
```

## Testing
- Acces with IP or public DSN => "default vhost"
- Acces with hosts modified (example.com and www.example.com to the EC2 IP) => "example.com vhost"

## One shot
```
sudo yum update -y
sudo yum install -y httpd24 php56
sudo yum install -y php56-mysqlnd
sudo chkconfig httpd on
sudo service httpd start
sudo groupadd www
sudo usermod -a -G www ec2-user
sudo chown -R root:www /var/www/html
sudo chmod 2775 /var/www/html
sudo find /var/www -type d -exec chmod 2775 {} \;
sudo find /var/www -type f -exec chmod 0664 {} \;
sudo rm /etc/httpd/conf.d/autoindex.conf
sudo rm /etc/httpd/conf.d/welcome.conf
mkdir /var/www/html/vhosts
mkdir /var/www/html/vhosts/default
echo "default vhost" > /var/www/html/vhosts/default/index.html
sudo nano /etc/httpd/conf.d/000_default.conf
sudo service httpd reload
mkdir /var/www/html/vhosts/example.com
echo "example.com vhost" > /var/www/html/vhosts/example.com/index.html
sudo nano /etc/httpd/conf.d/001_example.com.conf
sudo service httpd restart
```
