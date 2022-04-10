
USERNAME="lucasfrct"
EMAIL="lucasfrct@gmail.com"
REPOSITORY="ms-authentication-mirror-node.git"

git config --global user.name $USERNAME 
git config --global user.email $EMAIL
git config --global color.ui true
ssh-keygen -t rsa -C $EMAIL
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
git remote -v
git remote set-url origin git@github.com:$USERNAME/$REPOSITORY