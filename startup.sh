#!/bin/bash

CEOS_IMAGE=ceosimage:4.21.4F

ping -q -c5 google.com > /dev/null

if [ $? -eq 0 ]
then
	echo "connectivity is there"
else    echo "connectivity is not there"
        exit 1
fi

echo "creating containers"
docker create --name=leaf1 --privileged -p 6031:6030 -p 8081:80 -p 4041:443 -e CEOS=1 -e container=docker -e EOS_PLATFORM=ceoslab -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e ETBA=1 -e INTFTYPE=eth -i -t $CEOS_IMAGE /sbin/init
docker create --name=leaf2 --privileged -p 6032:6030 -p 8082:80 -p 4042:443 -e CEOS=1 -e container=docker -e EOS_PLATFORM=ceoslab -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e ETBA=1 -e INTFTYPE=eth -i -t $CEOS_IMAGE /sbin/init
docker create --name=leaf3 --privileged -p 6033:6030 -p 8083:80 -p 4043:443 -e CEOS=1 -e container=docker -e EOS_PLATFORM=ceoslab -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e ETBA=1 -e INTFTYPE=eth -i -t $CEOS_IMAGE /sbin/init
docker create --name=leaf4 --privileged -p 6034:6030 -p 8084:80 -p 4044:443 -e CEOS=1 -e container=docker -e EOS_PLATFORM=ceoslab -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e ETBA=1 -e INTFTYPE=eth -i -t $CEOS_IMAGE /sbin/init
docker create --name=spine1 --privileged -p 6038:6030 -p 8088:80 -p 4048:443 -e CEOS=1 -e container=docker -e EOS_PLATFORM=ceoslab -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e ETBA=1 -e INTFTYPE=eth -i -t $CEOS_IMAGE /sbin/init
docker create --name=spine2 --privileged -p 6039:6030 -p 8089:80 -p 4049:443 -e CEOS=1 -e container=docker -e EOS_PLATFORM=ceoslab -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e ETBA=1 -e INTFTYPE=eth -i -t $CEOS_IMAGE /sbin/init
docker create --name=mgt1 -it burnyd/ubuntu-oc:latest

echo "creating networking"
docker network create mgt
docker network create leaf1spine1
docker network create leaf1spine2
docker network create leaf2spine1
docker network create leaf2spine2
docker network create leaf3spine1
docker network create leaf3spine2
docker network create leaf4spine1
docker network create leaf4spine2
docker network create leaf1leaf2
docker network create leaf3leaf4

docker network connect mgt mgt1
docker network connect mgt leaf1
docker network connect mgt leaf2
docker network connect mgt leaf3
docker network connect mgt leaf4
docker network connect mgt spine1
docker network connect mgt spine2
docker network connect leaf1spine1 leaf1
docker network connect leaf1spine1 spine1
docker network connect leaf1spine2 leaf1
docker network connect leaf1spine2 spine2

docker network connect leaf2spine1 leaf2
docker network connect leaf2spine1 spine1
docker network connect leaf2spine2 leaf2
docker network connect leaf2spine2 spine2

docker network connect leaf3spine1 leaf3
docker network connect leaf3spine1 spine1
docker network connect leaf3spine2 leaf3
docker network connect leaf3spine2 spine2

docker network connect leaf4spine1 leaf4
docker network connect leaf4spine1 spine1
docker network connect leaf4spine2 leaf4
docker network connect leaf4spine2 spine2

docker network connect leaf1leaf2 leaf1
docker network connect leaf1leaf2 leaf2

docker network connect leaf3leaf4 leaf3
docker network connect leaf3leaf4 leaf4

echo "starting ceos containers this may take a while"
docker start leaf1
docker start leaf2
docker start leaf3
docker start leaf4
docker start spine1
docker start spine2

sleep 180s

echo "Starting infrastructure containers"

docker start mgt1

echo "copying over configs"
docker cp ./configs/leaf1/startup-config leaf1:/mnt/flash/startup-config
docker cp ./configs/leaf2/startup-config leaf2:/mnt/flash/startup-config
docker cp ./configs/leaf3/startup-config leaf3:/mnt/flash/startup-config
docker cp ./configs/leaf4/startup-config leaf4:/mnt/flash/startup-config
docker cp ./configs/spine1/startup-config spine1:/mnt/flash/startup-config
docker cp ./configs/spine2/startup-config spine2:/mnt/flash/startup-config

sleep 10s

docker exec -it leaf1 Cli -p 15 -c "copy start run"
docker exec -it leaf2 Cli -p 15 -c "copy start run"
docker exec -it leaf3 Cli -p 15 -c "copy start run"
docker exec -it leaf4 Cli -p 15 -c "copy start run"
docker exec -it spine1 Cli -p 15 -c "copy start run"
docker exec -it spine2 Cli -p 15 -c "copy start run"

echo "********** To enter the lab please docker exec -it mgt1 bash *********"
