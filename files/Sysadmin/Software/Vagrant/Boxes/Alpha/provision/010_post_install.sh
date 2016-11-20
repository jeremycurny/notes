#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Start
echo "010_post_install.sh start"

# Post install
echo "Post install"
service apache2 restart
service mysql restart

# End
echo "010_post_install.sh end"
