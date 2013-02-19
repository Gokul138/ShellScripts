######Author Gokul S. Evuri (gokul@evuri.com)#####
#!/bin/bash
echo "$(tput bold)$(tput setaf 4)Hello Welcome, Any errors contact gusevugo@student.gu.se"

echo "$(tput bold)$(tput setaf 4)****Read the Following carefully and do as so for a successful installation****$(tput sgr0)"
echo "$(tput bold)Enter the following and when asked for confirmation to install any package [Y/N] please press \"Y\" and [ENTER]"

echo "$(tput bold)$(tput setaf 4)Now, enter your group. example:group-1, and press [ENTER] key"

cd 
PWD=$(pwd)

read N_GROUP

export N_GROUP

#echo "$(tput bold)$(tput setaf 4)And Elease enter your registered email on git, example:your_email@youremail.com followed by [ENTER] key$(tput sgr0)"

#read G_EMAIL

#ask user if every thing entered correct or want to enter it again?
#echo "$(tput bold)Have you entered your group name and email correctly? press /"[Y/N]/" and then [ENTER] key" 
echo "$(tput bold)Have you entered your group name correctly? press "[Y/N]" and then [ENTER] key" 
read BOOL_YN

if [[ $BOOL_YN = 'Y' || $BOOL_YN = 'y' || $BOOL_YN = '' ]]; then

#use the following functions in new windows
#super component function
#other components functions


START_SUPERCOMPONENT (){
 cd "/opt/msv/$N_GROUP/bin"
 ./supercomponent --cid=111
}

export -f START_SUPERCOMPONENT

START_TESTSENSORBOARDSENDER (){
 cd "/opt/msv/$N_GROUP/bin"
 ./testsensorboardsender --cid=111
}

export -f START_TESTSENSORBOARDSENDER

START_SENSORBOARD (){
 cd "/opt/msv/$N_GROUP/bin"
 ./sensorboard --cid=111
}

export -f START_SENSORBOARD

#start_other_component (){}

#export -f start_other_component

START_TEST (){
gnome-terminal --execute bash -c "START_SUPERCOMPONENT;bash"  #execute bash in new terminal
gnome-terminal --execute bash -c "START_TESTSENSORBOARDSENDER;bash"
gnome-terminal --execute bash -c "START_SENSORBOARD;bash"
}

#export -f START_TEST # export function start_test

DELETE_ANY_EXISTING (){
cd 
sudo rm -rf 2013-mini-smart-vehicles
sudo rm -rf /opt/msv
}

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



# add a case statement to check if it is available, if not install git core
echo "adding git-core repository"
sudo add-apt-repository -q -y ppa:git-core/ppa



echo "updating local repo"
sudo apt-get -q -y update

echo "installing git"
sudo apt-get -q -y install git

echo "installing git-core"
sudo apt-get -q -y install git-core

echo "cleaning"
sudo apt-get -q -y clean

echo "autoremove"
sudo apt-get -q -y autoremove

echo "installing emacs"
sudo apt-get -q -y install emacs

echo "installing gtk packages to solve gtk issues in emacs"
sudo apt-get -q -y install qtk2-engines-pixbuf

echo "deleting any existid files/versions of opendavinci,hesperia on the drive"
DELETE_ANY_EXISTING


echo "$(tput bold)$(tput setaf 4)******READ THE FOLLOWING******$(tput sgr0)"
echo "generating ssh key"
echo "$(tput bold)Just Press [ENTER] key during the next step"
echo "$(tput bold)If asks for \"Overwrite (y/n)\" press \"Y\" and then [ENTER] key thrice.$(tput sgr0)"
#sudo ssh-keygen -t rsa -C $G_EMAIL

#echo "Installing xclip"
#sudo apt-get -q -y install xclip

#cd
#sudo xclip -sel clip < /root/.ssh/id_rsa.pub
#sudo ssh-add /root/.ssh/id_rsa

echo "$(tput bold)$(tput setaf 4)An SSH key containing emacs window will appear, copy the whole thing from that"
echo "$(tput bold) go to https://github.com/account/ssh"
echo "$(tput bold) click \"Add another public key\" "
echo "$(tput bold) paste(Ctrl+V or right click paste) in 'key' box and press \"Add Key\"."
echo "P.S: No 'Title' needed"
echo "$(tput bold) when you are done come back here and press [ENTER]key"

cd 
#sudo emacs /root/.ssh/id_rsa.pub &

#read DONE

git clone https://github.com/se-research/2013-mini-smart-vehicles.git

#echo $DONE


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


cd 2013-mini-smart-vehicles/project-template && sudo cp -r * ../"$N_GROUP" && cd ..

sudo mkdir /opt/msv
sudo mkdir /opt/msv/$N_GROUP

cd "$N_GROUP"/sources/OpenDaVINCI-msv && sudo mkdir build

echo "Generating cmake files"
sudo cmake -DCMAKE_INSTALL_PREFIX=/opt/msv/"$N_GROUP"/

echo "make all"
sudo make all

echo "Testing the system"
sudo make test

echo "Installing the system"
sudo make install

#echo "next implementation with demo starting supercomponent and fixing functional checks"


INSTALL_HESPERIALIGHT (){
 sudo apt-get install freeglut3 libqt4-dev libqwt5-qt4-dev libqwt5-qt4 libqt4-opengl-dev libdb4.7-dev libzip-dev libboost1.42-dev python ccache libdb-dev

cd

cd 2013-mini-smart-vehicles/$N_GROUP/sources/hesperia-light/

./build.sh

}


START_TEST

else echo "please run the script again";

fi
