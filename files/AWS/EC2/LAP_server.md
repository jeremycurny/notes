# Installing a LAP server (Linux, Apache, PHP) on EC2 instance and Vhosts

## Initialization (as root)

### Packages
```bash
yum update -y
yum install -y httpd24 php56
```
### Httpd start and start on system boot
```bash
chkconfig httpd on
service httpd start
```

### Group www and modify permissions
```bash
groupadd www
usermod -a -G www ec2-user
chown -R root:www /var/www/html
chmod 2775 /var/www/html
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
```

### Deleting amazon demo files
```bash
rm /etc/httpd/conf.d/autoindex.conf
rm /etc/httpd/conf.d/welcome.conf
```

## Vhosts (as ec2-user)
```bash
mkdir /var/www/html/vhosts
```

### default Vhost
```bash
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

```bash
sudo service httpd reload
```

### example.com Vhost
```bash
mkdir /var/www/html/vhosts/example.com
echo "example.com vhost" > /var/www/html/vhosts/example.com/index.html
sudo nano /etc/httpd/conf.d/001_example.com.conf
```

```
<VirtualHost *:80>
  ServerName example.com
  ServerAlias www.example.com
  DocumentRoot /var/www/html/vhosts/example.com
</VirtualHost>
```

## Restarting httpd
```bash
sudo service httpd restart
```

## Testing
- Acces with IP or public DSN => "default vhost"
- Acces with hosts modified (example.com and www.example.com to the EC2 IP) => "example.com vhost"
