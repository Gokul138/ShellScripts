echo "Hello Welcome, Any errors contact gusevugo@student.gu.se"

echo "****Read the Following carefully and do as so for a successful installation****"
echo "please enter the following and when asked for confirmation to install any package [Y/N] please press \"Y\" and [ENTER]"

echo "Now, enter your group. example:group-1, and press [ENTER] key"
read group

echo "And Elease enter your registered email on git, example:your_email@youremail.com followed by [ENTER] key"

read email

cd 

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
sudo add-apt-repository -q -y ppa:git-core/ppa

echo "updating local repo"
sudo apt-get -q -y update

echo "installing git"
sudo apt-get -q -y install git

echo "cleaning"
sudo apt-get -q -y clean

echo "autoremove"
sudo apt-get -q -y autoremove


echo "generating ssh key"
sudo ssh-keygen -t rsa -C "$email"

echo "Installing xclip"
sudo apt-get -q -y install xclip

sudo xclip -sel clip < ~/.ssh/id_rsa.pub

sudo ssh-add ~/.ssh/id_rsa

echo "SSH key has been copied to your clipboard, please got to https://github.com/account/ssh and click \"Add another public key\" and paste the clipboard and press \"Add Key\"."

read done

git clone https://github.com/se-research/2013-mini-smart-vehicles.git

echo "$done"


echo "installing qt4-dev-tools"
sudo apt-get install qt4-dev-tools

echo "installing freeglut3"
sudo apt-get install freeglut3

echo "installing libqt4-dev"
sudo apt-get install libqt4-dev

echo "installing libqwt5-qt4-dev"
sudo apt-get install libqwt5-qt4-dev

echo "installing libqwt5-qt4"
sudo apt-get install libqwt5-qt4 

echo "installing libqt4-opengl-dev"
sudo apt-get install libqt4-opengl-dev 

echo "installing libqwt5-qt4"
sudo apt-get install libdb4.7-dev 

echo "installing libzip-dev"
sudo apt-get install libzip-dev 

echo "installing libboost1.42-dev"
sudo apt-get install libboost1.42-dev 

echo "installing python"
sudo apt-get install python

echo "installing ccache"
sudo apt-get install ccache


cd 2013-mini-smart-vehicles/project-template && cp -r * ../"$group" && cd ..

sudo mkdir /opt/msv
sudo mkdir /opt/msv/"$group"

cd "$group"/sources/OpenDaVINCI-msv && sudo mkdir build

cmake -DCMAKE_INSTALL_PREFIX=/opt/msv/"$group"

make all

make test

make install

echo "next implementation with demo starting supercomponent and fixing functional checks"