#!/bin/bash

SALT_MASTER="10.0.0.15"
#Check if /etc/salt is exist
if [ -d "/etc/salt" ]; then
        echo -e "Salt directoy exists"
else
        #create dir /etc/salt
        echo -e "Salt directoy is missing, creating one"
        mkdir -p /etc/salt/pki/minion/
fi

#Check if there is key in /mnt/flash
if [ -d "/mnt/flash/key" ]; then
        echo -e "Salt key exists"
else
        #CREATE /etc/salt
        echo -e "Salt minion key is missing, creating one in flash"
        mkdir -p /mnt/flash/key
        cd /mnt/flash/key
        salt-key --gen-keys=minion
fi

#Check if there is key in salt directory
if [ -f "/etc/salt/pki/minion/minion.pub" ];
then
   echo -e "Salt key exists in Salt's directory"
else
   echo -e "Salt key is missing. Coping flash's key to salt directory"
   cp /mnt/flash/key/m* /etc/salt/pki/minion/
fi

if grep -q master "/etc/salt/minion"
then
  echo "Salt master host record exists"
else
  echo "Missing Salt master host record"
  echo "master: $SALT_MASTER">>/etc/salt/minion
fi

if grep -q "driver" /etc/salt/minion
then
  echo "Salt minion is ready"
else
  echo -e "Preparing Salt minion configuration"
  echo "######   NAPALM connection settings   ######
############################################

napalm:
  driver: eos
  optional_args:
    eos_transport: socket
" >> /etc/salt/minion
fi


#Check if Salt minion is running
if pgrep "salt-minion" > /dev/null
then
   echo -e "Salt minion is running"
else
   echo -e "Starting Salt minion"
   salt-minion -d
fi

