 #!/bin/bash +x

localPath=$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")
cd /tmp
sudo pacman -S --noconfirm yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query
yes | makepkg -si
cd /tmp
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
yes | makepkg -si
yaourt -S virtualbox_bin --noconfirm
yes | yaourt -Syu
yaourt -Syu --noconfirm --aur --devel
cd $localPath