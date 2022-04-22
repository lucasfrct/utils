#!/bin/bash +x

source ./qgx-init-db.sh
sleep 2
gnome-terminal --tab --title="GO PROXY" --command="bash -c 'cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-proxy-reverse-service-go; ./local.sh; 
$SHELL'" 
sleep 1
gnome-terminal --tab --title="GO JWT" --command="bash -c 'sleep 1; cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-jwt-service-go; ./local.sh; 
$SHELL'" 
sleep 1
gnome-terminal --tab --title="GO UTILS" --command="bash -c 'sleep 1;cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-utils-service-go; ./local.sh;
$SHELL'"