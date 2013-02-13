echo "updating"
sudo apt-get update

echo "upgrading"
sudo apt-get upgrade

echo "dist-upgrading"
sudo apt-get dist-upgrade

echo "cleaning"
sudo apt-get clean

echo "installing CV libraries, GHGUI libraries and CMake"
sudo apt-get -q -y install build-essential libcv-dev libhighgui-dev cmake

echo "cleaning"
sudo apt-get clean

echo "installing python-software-properties"
sudo apt-get -q -y install python-software-properties

echo "adding git-core repository"
sudo add-apt-repository ppa:git-core/ppa

echo "updating local repo"
sudo apt-get update

echo "installing git"
sudo apt-get -q -y install git

echo "cleaning"
sudo apt-get clean

echo "autoremove"
sudo apt-get autoremove

echo "please enter your registered email on git, ex:your_email@youremail.com followed by [ENTER] key"

read email
echo "generating ssh key"
sudo ssh-keygen -t rsa -C "$email"

echo "Installing xclip"
sudo apt-get -q -y install xclip

xclip -sel clip < ~/.ssh/id_rsa.pub

echo "SSH key has been copied to your clipboard, please got to https://github.com/account/ssh and click \"Add another public key\" and paste the clipboard and press \"Add Key\"."

ssh-add ~/.ssh/id_rsa

git clone https://github.com/se-research/2013-mini-smart-vehicles.git

echo "please enter your group. ex:group1, and press [ENTER] key"
read group
cd 2013-mini-smart-vehicles/project-template && cp -r * ../"$group" && cd ..

sudo mkdir /opt/msv
sudo mkdir /opt/msv/"$group"

cd "$group"/sources/OpenDaVINCI-msv && mkdir build

cmake -DCMAKE_INSTALL_PREFIX=/opt/msv/"$group"

cd ..

make all

make test

make install

echo "next implementation with demo starting supercomponent and fixing functional checks"