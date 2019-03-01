# Arista-Vagrant-Saltstack
![Alt text](saltbackground.jpg?raw=true "Pi")

Repo for testing of Saltstack on Arista EOS using Vagrant.

Please download any Arista virtualbox file and register it with vagrant.  Once the arista vbox file has been downloaded from the Arista website run the following command.

vagrant box add veos-4.x.vbox veos4.xx
vagrant box list #Should show what boxes are installed on the system.

Edit the Vagrantfile under the box and replace veos4.xx with what you named the vagrant box file.

vagrant up spine1 spine2 leaf1a leaf1b mgt1

Once all the boxes are up 
vagrant ssh mgt1
salt-key -L #This will list the salt minions
salt-key -A #This will accept all salt minions
salt '*' test.ping #This will send a test ping to all devices
