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

echo "$(tput bold)$(tput setaf 4)******READ THE FOLLOWING******$(tput sgr0)"
echo "generating ssh key"
echo "$(tput bold)Just Press [ENTER] key during the next step"
echo "$(tput bold)If asks for \"Overwrite (y/n)\" press \"Y\" and then [ENTER] key twice$(tput sgr0)"
sudo ssh-keygen -t rsa -C "$email"

echo "Installing xclip"
sudo apt-get -q -y install xclip

cd 

sudo xclip -sel clip < ./.ssh/id_rsa.pub

sudo ssh-add ./.ssh/id_rsa

echo "$(tput bold)$(tput setaf 4)SSH key has been copied to your clipboard"
echo "$(tput bold) got to https://github.com/account/ssh"
echo "$(tput bold) click \"Add another public key\" "
echo "$(tput bold) paste(Ctrl+V or right click) in 'key' box paste there and press \"Add Key\"."
echo "P.S: no 'Title' needed"
echo "$(tput setaf 2) Do not Use Ctrl+C now$(tput sgr0)"

read done

git clone https://github.com/se-research/2013-mini-smart-vehicles.git

echo "$done"


echo "installing qt4-dev-tools"
sudo apt-get install -q -y qt4-dev-tools

echo "installing freeglut3"
sudo apt-get install -q -y freeglut3

echo "installing libqt4-dev"
sudo apt-get install -q -y libqt4-dev

echo "installing libqwt5-qt4-dev"
sudo apt-get install -q -y libqwt5-qt4-dev

echo "installing libqwt5-qt4"
sudo apt-get install -q -y libqwt5-qt4 

echo "installing libqt4-opengl-dev"
sudo apt-get install -q -y libqt4-opengl-dev 

echo "installing libqwt5-qt4"
sudo apt-get install -q -y libdb4.7-dev 

echo "installing libzip-dev"
sudo apt-get install -q -y libzip-dev 

echo "installing libboost1.42-dev"
sudo apt-get install -q -y libboost1.42-dev 

echo "installing python"
sudo apt-get install -q -y python

echo "installing ccache"
sudo apt-get install -q -y ccache


cd 2013-mini-smart-vehicles/project-template && cp -r * ../"$group" && cd ..

sudo mkdir /opt/msv
sudo mkdir /opt/msv/"$group"

cd "$group"/sources/OpenDaVINCI-msv && sudo mkdir build

sudo cmake -DCMAKE_INSTALL_PREFIX=/opt/msv/"$group"

sudo make all

sudo make test

sudo make install

echo "next implementation with demo starting supercomponent and fixing functional checks"