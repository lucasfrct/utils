
#!/bin/bash +x

ec2PublicIp=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=jumpbox' --query 'Reservations[*].Instances[*].[PublicIpAddress,Tags[?Key==`Name`].Value[]]' --output text 2>&1 | head -n 1)

ssh -i $HOME/development/jumpbox/jumpbox.pem -o ServerAliveInterval=10 ec2-user@$ec2PublicIp; 



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