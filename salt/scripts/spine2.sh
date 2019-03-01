#!/bin/sh

sleep 5

FastCli -p 15 -c "configure
hostname spine2
!
username api secret password
!
username vagrant secret vagrant
!
event-handler Terminattr
   trigger on-boot
   action bash /usr/bin/TerminAttr -grpcaddr 0.0.0.0:6042 -allowed_ips 0.0.0.0/0 -disableaaa
!
ip name-server vrf default 8.8.8.8
ip domain-list 8.8.8.8
!
interface Ethernet1
  no switchport
  ip address 10.0.0.102/24
!
interface Ethernet2
description connection-to-leaf1a
no switchport
ip address 10.0.12.3/24
!
interface Ethernet3
description connection-to-leaf1b
no switchport
ip address 10.0.22.3/24
!
interface Ethernet4
description connection-to-leaf2a
no switchport
ip address 10.0.212.3/24
!
interface Ethernet5
description connection-to-leaf2b
no switchport
ip address 10.0.222.3/24
!
interface Ethernet6
description connection-to-gobgp
no switchport
ip address 10.0.251.3/24
!
int lo0 
ip address 4.4.4.4/32
!
ip routing
!
ip route 0.0.0.0/0 10.0.2.2
!
management api http-commands
   protocol http
   protocol unix-socket
   no shutdown
!
management api gnmi
transport grpc default
port 6030
no ssl profile
no shutdown
!
exit"

sleep 5
echo "Adding DNS"
echo nameserver 8.8.8.8  >> /etc/resolv.conf

wget https://salt-eos.netops.life/salt-eos-latest.swix -P /mnt/flash
wget https://salt-eos.netops.life/startup.sh -P /mnt/flash

echo "Replacing the salt master IP"
sed -i '/SALT_MASTER="x.x.x.x"/c\SALT_MASTER="10.0.0.15"' /mnt/flash/startup.sh

echo "Installing extension through EOS cli"
FastCli -p 15 -c "copy flash:salt-eos-latest.swix extension:"
FastCli -p 15 -c "extension salt-eos-latest.swix force"

sleep 10

echo "Running the startup script"
sudo su 
source /mnt/flash/startup.sh

