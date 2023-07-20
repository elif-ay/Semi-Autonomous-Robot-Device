#!/bin/bash
sudo chmod a+rw /dev/ttyUSB0
cd /home/grup3/oto_robot/Code/Server/Mapping/robot/build
make
cd /home/grup3/oto_robot/Code/Server
sudo python main.py &
raspivid -o - -t 0 -n -w 640 -h 480 -fps 30 -b 1000000 -fl | cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8090}' :demux=h264 &

wait

#then enter lidar port number
#make the shell script executable by running chmod +x serverMake.sh . note that chmod should be run in the shell script directory then run ./serverMakke.sh
