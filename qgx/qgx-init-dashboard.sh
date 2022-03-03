gnome-terminal --tab --title="DASHBOARD ANGULAR" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-dashboard-angular; npm start;
$SHELL'" 
sleep 1
gnome-terminal --tab --title="DASHBOARD SERVICE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-dashboard-service-node; npm run dev;
$SHELL'"
sleep 1
gnome-terminal --tab --title="ONBOARDING SERVICE" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-onboarding-service-node; npm run dev;
$SHELL'"