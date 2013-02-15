# Author Gokul S. Evuri (gokul@evuri.com)

echo "$(tput bold)$(tput setaf 4)Hello Welcome, Any errors contact gusevugo@student.gu.se"

echo "$(tput bold)$(tput setaf 4)****Read the Following carefully and do as so for a successful installation****$(tput sgr0)"
echo "$(tput bold)Enter the following and when asked for confirmation to install any package [Y/N] please press \"Y\" and [ENTER]"

echo "$(tput bold)$(tput setaf 4)Now, enter your group. example:group-1, and press [ENTER] key"
read group

echo "$(tput bold)$(tput setaf 4)And Elease enter your registered email on git, example:your_email@youremail.com followed by [ENTER] key$(tput sgr0)"

read email

#ask user if every thing entered correct or want to enter it again?
echo "$(tput bold)Have you entered your group name and email correctly? press /"[Y/N]/" and then [ENTER] key" 
read boolYN

if [[ $boolYN = 'Y' || $boolYN = 'y'  ]]; then

#use the following functions in new windows
#super component function
#other components functions

start_supercomponent (){
 cd /opt/msv/"$group"/bin
 ./supercomponent --cid=111
}

export -f start_supercomponent

start_testsensorboardsender (){
 cd /opt/msv/"$group"/bin
 ./testsensorboardsender --cid=111
}

export -f start_testsensorboardsender

start_sensorboard (){
 cd /opt/msv/"$group"/bin
 ./sensorboard --cid=111
}

export -f start_sensorboard

#start_other_component (){}

#export -f start_other_component

start_test (){
gnome-terminal --execute bash -c "start_supercomponent;bash"  #execute bash in new terminal
gnome-terminal --execute bash -c "start_testsensorboardsender;bash"
gnome-terminal --execute bash -c "start_sensorboard;bash"
}

export -f start_test # export function start_test

delete_any_existing (){
cd 
sudo rm -rf 2013-mini-smart-vehicles
sudo rm -rf /opt/msv
}

export -f delete_any_existing

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
sudo apt-get -q -y clean

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

echo "deleting any existid files/versions of opendavinci,hesperia on the drive"
delete_any_existing

echo "$(tput bold)$(tput setaf 4)******READ THE FOLLOWING******$(tput sgr0)"
echo "generating ssh key"
echo "$(tput bold)Just Press [ENTER] key during the next step"
echo "$(tput bold)If asks for \"Overwrite (y/n)\" press \"Y\" and then [ENTER] key thrice.$(tput sgr0)"
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


cd 2013-mini-smart-vehicles/project-template && sudo cp -r * ../"$group" && cd ..

sudo mkdir /opt/msv
sudo mkdir /opt/msv/"$group"

cd "$group"/sources/OpenDaVINCI-msv && sudo mkdir build

echo "Generating cmake files"
sudo cmake -DCMAKE_INSTALL_PREFIX=/opt/msv/"$group"/

echo "make all"
sudo make all

echo "Testing the system"
sudo make test

echo "Installing the system"
sudo make install

#echo "next implementation with demo starting supercomponent and fixing functional checks"

start_test

else echo "please run the script again";

fi