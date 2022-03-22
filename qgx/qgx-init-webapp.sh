gnome-terminal --tab --title="WEBAPP ANGULAR" --command="bash -c 'cd ~/development/repository/qgx-payment-ip-webapp-angular; npm start; $SHELL'"
gnome-terminal --tab --title="BALANCE" --command="bash -c 'cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-balance-service-go; ./local.sh; $SHELL'"
gnome-terminal --tab --title="ESCROW" --command="bash -c 'cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-escrow-service-go; ./local.sh; $SHELL'"
gnome-terminal --tab --title="TRANSFERS" --command="bash -c 'cd ~/go/src/github.com/qgx-pagamentos/qgx-payment-ip-transfers-service-go; ./local.sh; $SHELL'"
