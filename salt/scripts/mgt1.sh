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

echo "adding respositories"
echo "ansible for apt-get"
apt-add-repository ppa:ansible/ansible -y

echo "updating apt-get"
sudo apt-get update -y 
echo "installing everything necessary for DNS and Bind"
sudo apt-get install -y git ansible python-pip python-dev default-jre libffi-dev libssl-dev python-dev python-cffi libxslt1-dev python-pip -y 

sudo mkdir -p /srv/salt/
sudo mkdir -p /srv/salt/pillar/
sudo mkdir -p /srv/salt/states/
sudo mkdir -p /srv/salt/templates/
sudo mkdir -p /srv/salt/states/leaf
sudo mkdir -p /srv/salt/states/spine
sudo mkdir -p /srv/salt/reactor/

echo "fixing the default ubuntu pyOpenSSL issue"
pip install --upgrade pyOpenSSL

echo "Install napalm EOS libraries"
sudo pip install napalm
sudo pip install napalm-logs
sudo pip install napalm-base

echo "Installing Saltstack"
sudo wget -O bootstrap-salt.sh https://bootstrap.saltstack.com/develop
sudo sh bootstrap-salt.sh -M

echo "upgrading pip"
sudo pip install -U pip setuptools
sudo pip install --upgrade pip

echo "Get the necessary libraries"
sudo pip install jsonrpclib

echo "Copying salt files"
sudo cp /vagrant/scripts/salt/master /etc/salt/master
sudo cp /vagrant/scripts/salt/templates/vlans.jinja /srv/salt/templates
sudo cp /vagrant/scripts/salt/states/vlans.sls /srv/salt/states/leaf/
sudo cp /vagrant/scripts/salt/reactor/leafvlansztp.sls /srv/salt/reactor/leafvlansztp.sls
sudo cp /vagrant/scripts/salt/reactor/slackgenerate.sls /srv/salt/reactor/slackgenerate.sls

echo "restarting the master service" 
service salt-master restart
