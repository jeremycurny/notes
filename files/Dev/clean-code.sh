#!/bin/sh

# DOS to UNIX (To LF)
# Trim trailing white spaces
# Ensure newline at eof

# All
find . -type f -exec dos2unix {} \;

# CSS
find . -name "*.css" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'
find . -name "*.css" -type f -print0 | xargs -0 sed -i -e '$a\'

# JS
find . -name "*.js" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'
find . -name "*.js" -type f -print0 | xargs -0 sed -i -e '$a\'

# PHP
find . -name "*.php" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'
find . -name "*.php" -type f -print0 | xargs -0 sed -i -e '$a\'

# PHTML
find . -name "*.phtml" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'
find . -name "*.phtml" -type f -print0 | xargs -0 sed -i -e '$a\'
