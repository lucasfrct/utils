#!/bin/bash +x

## removem  fim de linha do windows 
sed -i 's/\r$//' ./clean-intall.sh
find . -type d -print0 | xargs -0 chmod 755  
find . -type f -print0 | xargs -0 chmod 644 
find . -type f -name "*.sh" -exec chmod +x {} \; 