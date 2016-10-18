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
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install -y oracle-java8-installer oracle-java8-set-default
```

### MySQL

```
apt-get install -y mysql-server
```

### NodeJS / NPM

```
curl -sL https://deb.nodesource.com/setup_4.x | bash
apt-get install -y nodejs
```

### PHP

```
apt-get install -y php5 php5-curl php5-gd php5-mcrypt php5-mysql
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer
```

## Development

### PHPStorm

```
wget https://download.jetbrains.com/webide/PhpStorm-2016.2.1.tar.gz
tar xfz PhpStorm-2016.2.1.tar.gz
bash PhpStorm-162.1889.1/bin/phpstorm.sh
```
