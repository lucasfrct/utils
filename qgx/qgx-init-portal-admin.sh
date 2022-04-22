#!/bin/bash +x

gnome-terminal --tab --title="OPTIN SERVICE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-optin-service-node; npm run dev;
$SHELL'"
gnome-terminal --tab --title="TERMS SERVICE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-terms-service-node; npm run dev;
$SHELL'"
gnome-terminal --tab --title="ADMIN CONFIG" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-portal-admin-config-service-node; npm run dev;
$SHELL'"
sleep 1
gnome-terminal --tab --title="ADMIN ACCOUNT" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-portal-admin-account-service-node; npm run dev;
$SHELL'"
sleep 1
gnome-terminal --tab --title="ADMIN TRANSACTION" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-portal-admin-transaction-service-node; npm run dev;
$SHELL'"
sleep 1
gnome-terminal --tab --title="ADMIN ANGULAR" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-portal-admin-angular; npm start;
$SHELL'" 