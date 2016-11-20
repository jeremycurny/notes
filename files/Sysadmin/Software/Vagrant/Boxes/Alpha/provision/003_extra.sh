#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Start
echo "003_extra.sh start"

## Adminer
echo "Adminer"
mkdir -p /var/www/html/vhosts/default/adminer
curl -o /var/www/html/vhosts/default/adminer/index.php http://www.adminer.org/static/download/4.2.5/adminer-4.2.5-en.php

## Composer
echo "Composer"
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer

## Infos
echo "Infos"
mkdir -p /var/www/html/vhosts/default/infos
cat <<EOF > /var/www/html/vhosts/default/infos/index.php
<?php
  phpinfo();
EOF

# End
echo "003_extra.sh end"
