#!/bin/sh

# DOS to UNIX (To LF)
find . -type f -exec dos2unix {} \;

# Trim trailing white spaces
find . -name "*.php" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'

# Ensure newline at eof
find . -name "*.php" -type f -print0 | xargs -0 sed -i -e '$a\' file
