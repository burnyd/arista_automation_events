apt-get update && apt-get install -y git python-pip python-dev default-jre libffi-dev libssl-dev python-dev python-cffi libxslt1-dev python-pip
pip install --upgrade pyOpenSSL

 mkdir -p /srv/salt/
 mkdir -p /srv/salt/pillar/
 mkdir -p /srv/salt/states/
 mkdir -p /srv/salt/templates/
 mkdir -p /srv/salt/states/leaf
 mkdir -p /srv/salt/states/spine
 mkdir -p /srv/salt/reactor/
 mkdir -p /etc/salt
cp salt/scripts/salt/master /etc/salt/

wget -O bootstrap-salt.sh https://bootstrap.saltstack.com/
sh bootstrap-salt.sh -M

wget -qO - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
apt-get install apt-transport-https ca-certificates -y
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" |  tee -a /etc/apt/sources.list.d/saltstack.list
apt-get update && apt-get install salt-master salt-minion -y


#####
