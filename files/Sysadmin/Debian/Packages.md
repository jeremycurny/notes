# Debian packages

## Utils

```
apt-get install -y autoconf automake build-essential curl fail2ban gcc htop make mysql-client sudo
apt-get install -y chromium
```

## Apache

```
apt-get install -y apache2 openssl
a2enmod deflate expires headers rewrite ssl
service apache2 restart
```

## MySQL

```
apt-get install -y mysql-server
```


## PHP

```
apt-get install -y php5 php5-curl php5-gd php5-mcrypt php5-mysql
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar
```

## Git

```
apt-get install -y git
```
