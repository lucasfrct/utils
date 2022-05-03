
sudo apt -y update && apt -y upgrade
sudo apt -y install build-essential wget git unzip gcc tzdata
sudo export TZ=America/Sao_Paulo
sudo ln -fs /usr/share/zoneinfo/TZ=America/Sao_Paulo /etc/localtime && echo TZ=America/Sao_Paulo > /etc/timezone 
sudo dpkg-reconfigure -f noninteractive tzdata
sudo apt install -y libpq-dev zlib1g-dev shared-mime-info libaio1 libaio-dev --no-install-recommends 
sudo apt -y install alien libaio1 unixodbc
sudo export NLS_DATE_FORMAT="dd/mm/yyyy"

## GITHUB Configure
yes | sudo pacman -Sy openssh
git config --global user.name "lucasfrct"
git config --global user.email "lucasfrct@gmail.com"
git config --global color.ui true
git config --global core.editor "code --wait"
git config --global merge.conflictstyle diff3
# ssh-keygen -t rsa -C "lucasfrct@gmail.com"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
git remote -v
# git remote set-url origin git@github.com:lucasfrct/{repository}.git

mkdir github.com github.com/tai-uisa github.com/tai-uisa

## DOCKER
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt update
sudo apt -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
apt-cache madison docker-ce
sudo apt -y install docker
sudo apt -y install docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo chmod -R 777 /var/run/docker.sock
sudo chown $USER /var/run/docker.sock
sudo usermod -aG docker $USER
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo service docker restart
