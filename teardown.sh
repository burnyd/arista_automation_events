#!/bin/bash

echo "stopping and removing ceos1"
docker stop leaf1 && docker rm leaf1

echo "stopping and removing ceos2"
docker stop leaf2 && docker rm leaf2

echo "stopping and removing ceos3"
docker stop leaf3 && docker rm leaf3

echo "stopping and removing ceos4"
docker stop leaf4 && docker rm leaf4

echo "stopping and removing ceos5"
docker stop spine1 && docker rm spine1

echo "stopping and removing ceos6"
docker stop spine2 && docker rm spine2

echo "stopping and removing mgt1"
docker stop mgt1 && docker rm mgt1

echo "removing networking"
docker network rm mgt
docker network rm leaf1spine1
docker network rm leaf1spine2
docker network rm leaf2spine1
docker network rm leaf2spine2
docker network rm leaf3spine1
docker network rm leaf3spine2
docker network rm leaf4spine1
docker network rm leaf4spine2
docker network rm leaf1leaf2
docker network rm leaf3leaf4

echo "finished"
