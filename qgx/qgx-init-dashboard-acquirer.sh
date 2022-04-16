#!/bin/bash +x

gnome-terminal --tab --title="DASHBOARD ACQUIRER" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-dashboard-acquirer-angular; npm start;
$SHELL'" 
sleep 1
gnome-terminal --tab --title="DASHBOARD ACQUIRER SERVICE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-dashboard-acquirer-service-node; npm run dev;
$SHELL'"