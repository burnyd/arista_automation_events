#!/bin/bash
#Todos
#loop through adding directories?
#Git clone && cd into directory then shell into this script to run the ansible playbook last?
#Clone the directory or add the salt swix/startup.sh files
#start the proxy minions
#Copy the salt custom grain for bgp
#Sync grains salt '*' saltutil.sunc_grains

ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
	echo "connectivity is there"
else    echo "connectivity is not there"
        exit 1 
fi 

sudo echo 192.168.0.4 salt >> /etc/hosts
sudo echo 192.168.0.4 master >> /etc/hosts


echo "Firewall rules for salt"
sudo ufw allow 4505:4506/tcp

echo "Checking connectivity exists"
ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
	echo "connectivity is there"
else    echo "connectivity is not there"
        exit 1 
fi 

echo "Adding salt directories"
sudo mkdir -p /srv/salt/
sudo mkdir -p /srv/salt/pillar/
sudo mkdir -p /srv/salt/states/
sudo mkdir -p /srv/salt/states/vlans/
sudo mkdir -p /srv/salt/templates/
sudo mkdir -p /srv/salt/_grains/

echo "fixing the default ubuntu pyOpenSSL issue"
pip install --upgrade pyOpenSSL

echo "Install napalm EOS libraries"
sudo pip install napalm
sudo pip install napalm-logs
sudo pip install napalm-base
sudo pip install jtextfsm

echo "Installing Saltstack"
sudo wget -O bootstrap-salt.sh https://bootstrap.saltstack.com/
sudo sh bootstrap-salt.sh -M

sleep 5

echo "restarting the master service" 
service salt-master restart

