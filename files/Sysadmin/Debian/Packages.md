# Debian packages

## Utils

```
apt-get install -y autoconf automake build-essential curl fail2ban htop mysql-client
apt-get install -y chromium
```

## Apache

```
apt-get install -y apache2 openssl
a2enmod expires headers rewrite ssl
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
