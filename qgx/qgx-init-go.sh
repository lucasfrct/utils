gnome-terminal --tab --title="MYSQL" --command="bash -c 'cd ~/development/database; docker-compose up -d; 
$SHELL'" --tab --title="GO PROXY" --command="bash -c 'cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-proxy-reverse-service-go; ./local.sh; 
$SHELL'" --tab --title="GO JWT" --command="bash -c 'cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-jwt-service-go; ./local.sh; 
$SHELL'" --tab --title="GO UTILS" --command="bash -c 'cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-utils-service-go; ./local.sh;
$SHELL'"