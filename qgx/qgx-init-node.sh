#!/bin/bash +x

gnome-terminal --tab --title="CREDENTIALS NODE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-credentials-service-node; npm run dev; 
$SHELL'" 
sleep 1
gnome-terminal --tab --title="ACCOUNT NODE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-account-service-node; npm run dev; 
$SHELL'" 
sleep 1
gnome-terminal --tab --title="PUBLIC NODE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-public-service-node; npm run dev;
$SHELL'"