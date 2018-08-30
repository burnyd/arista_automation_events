#!/usr/bin/env bash


sleep 5

#Check for ping connectivity to google before proceeding.

ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
	echo "connectivity is there"
else    echo "connectivity is not there"
        exit 1 
fi 

 

echo "Add dns names to etc hosts"

sudo echo 10.0.0.99 leaf1a  >> /etc/hosts
sudo echo 10.0.0.100 leaf1b  >> /etc/hosts
sudo echo 10.0.0.101 spine1  >> /etc/hosts
sudo echo 10.0.0.102 spine2  >> /etc/hosts
sudo echo 10.0.0.103 leaf2a  >> /etc/hosts
sudo echo 10.0.0.103 leaf2b  >> /etc/hosts
sudo echo 10.0.0.15 salt >> /etc/hosts


echo "updating apt-get"
sudo apt-get update -y 
echo "installing everything necessary for DNS and Bind"
sudo apt-get install -y git ansible python-pip python-dev default-jre libffi-dev libssl-dev python-dev python-cffi libxslt1-dev python-pip -y 

echo "Install salt agent"
wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh

