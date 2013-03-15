#!/bin/bash
######Author Gokul S. Evuri (gokul@evuri.com)#####
# To start OpenDavinci simulation

START_SUPERCOMPONENT_H (){
 cd "/home/msv/2013-mini-smart-vehicles/group-5/sources/hesperia-light/binaries/bin"
 ./supercomponent --cid=111
}

export -f START_SUPERCOMPONENT_H

START_MONITOR_H (){
 cd "/home/msv/2013-mini-smart-vehicles/group-5/sources/hesperia-light/binaries/bin"
 ./monitor --cid=111
}

export -f START_MONITOR_H

START_VEHICLE_H (){
 cd "/home/msv/2013-mini-smart-vehicles/group-5/sources/hesperia-light/binaries/bin"
 ./vehicle --cid=111
}

export -f START_VEHICLE_H

START_CAMGEN_H (){
 cd "/home/msv/2013-mini-smart-vehicles/group-5/sources/hesperia-light/binaries/bin"
 ./camgen --cid=111
}

export -f START_CAMGEN_H

START_IRUS_H (){
 cd "/home/msv/2013-mini-smart-vehicles/group-5/sources/hesperia-light/binaries/bin"
 ./irus --cid=111
}

export -f START_IRUS_H

START_COCKPIT (){
 cd "/opt/msv/group-5/bin"
 ./cockpit --cid=111
}

export -f START_COCKPIT

START_LANEDETECTOR (){
 cd "/opt/msv/group-5/bin"
 ./sensorboard --cid=111
}

export -f START_LANEDETECTOR

START_DRIVER (){
 cd "/opt/msv/group-5/bin"
 ./driver --cid=111
}

export -f START_DRIVER


START_SIMULATION (){
gnome-terminal --execute bash -c "START_SUPERCOMPONENT_H;bash"  #execute bash in new terminal
gnome-terminal --execute bash -c "START_MONITOR_H;bash"
gnome-terminal --execute bash -c "START_VEHICLE_H;bash"
gnome-terminal --execute bash -c "START_CAMGEN_H;bash"
gnome-terminal --execute bash -c "START_IRUS_H;bash"
gnome-terminal --execute bash -c "START_LANEDETECTOR;bash"
gnome-terminal --execute bash -c "START_DRIVER;bash"
}


START_SIMULATION