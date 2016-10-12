# Debian packages

## Système

```
apt-get install -y autoconf automake build-essential gcc linux-headers-$(uname -r) make
apt-get install -y python-software-properties software-properties-common
apt-get install -y fail2ban htop sudo
apt-get install -y curl git mysql-client
apt-get install -y chromium
```

## Server

### Apache

```
apt-get install -y apache2 openssl
a2enmod deflate expires headers rewrite ssl
service apache2 restart
```

### Java

```
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install-y  oracle-java8-installer oracle-java8-set-default
```

### MySQL

```
apt-get install -y mysql-server
```

### PHP

```
apt-get install -y php5 php5-curl php5-gd php5-mcrypt php5-mysql
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar
```
