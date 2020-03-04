#Todos
Create a Openconfig folder
Fix pyangbind && Fix dockerfile 
Update documentation for pyang
Fix restconf to look better json structure wise
Add Post restconf
Add restconf md readme
Add Netconf examples
Add Netconf readme 

# Requirements

* docker/Moby (tested in 17.09.0-ce)
* docker container burnyd/arista_automation_events
* Arista ceos-lab (tested in 4.21.7M, 4.22.0F)
* [Docker-topo](https://github.com/networkop/docker-topo)


#Todos
-Salt demos
-Finish nornir
-OpenBMP

# Issues

For any issue or general questions feel free to email me dhertzberg@arista.com

All Arista supported YANG models can be found in code [here](https://github.com/aristanetworks/yang)

![Alt text](images/overall.jpg?raw=true "lab")

This is a lab that will leverage docker-top and ceos as a whole.  Docker-topo is a great way of making a lab a
lab very quickly check out the link up top on how to get up and running with docker-topo.

At the time being there are some ansible and python examples.

# Get up and running

First install [Docker-topo](https://github.com/networkop/docker-topo) and get up running with ceos.

`git clone https://github.com/burnyd/arista_automation_events`

`cd arista_automation_events && cp -R config /config/`

`docker-topo --create -a base-lab.yml`  

`docker exec -it base-lab_lab-1 bash`  clone this diretory once inside and you can simply try any of the automation tools.
