# Arista Salt stack
![Alt text](saltbackground.jpg?raw=true "Pi")

Repo for testing of Saltstack on Arista EOS using Docker-topo.  This for now is a simple setup more to come soon.

Please read the Readme for getting started on the repo [Readme](https://github.com/burnyd/arista_automation_events/blob/master/README.md)
```console

docker-topo --create base-lab.yml #From the root of the arista_automation_events repo
```

This should look like the following

```console
root@office-pc:/opt/projects/arista_automation_events# docker-topo --create base-lab.yml 
INFO:__main__:
alias Spine1='docker exec -it base-lab_Spine1 Cli'
alias Spine2='docker exec -it base-lab_Spine2 Cli'
alias Leaf1='docker exec -it base-lab_Leaf1 Cli'
alias Leaf2='docker exec -it base-lab_Leaf2 Cli'
alias Leaf3='docker exec -it base-lab_Leaf3 Cli'
alias Leaf4='docker exec -it base-lab_Leaf4 Cli'
alias lab-1='docker exec -it base-lab_lab-1 sh'
INFO:__main__:All devices started successfully
```
Wait until the ceos containers have been up for 2-3 minutes
Start the salt master and minion on lab-1 ubuntu container.  Then start the proxy minions to control all the cEOS devices.

```console
docker exec -it base-lab_lab-1 bash
source /arista_automation_events/salt/salt.sh
```

Check to make sure that the proxy minions are running then accept the keys it might complain a lot on stdout until you accept the keys
```console
ps -f | grep salt
/usr/bin/python /usr/bin/salt-proxy --proxyid=base-lab_Leaf1
```
Check to see all the minion keys

```console
salt-key -L
Accepted Keys:
Denied Keys:
Unaccepted Keys:
base-lab_Leaf1
base-lab_Leaf2
base-lab_Leaf3
base-lab_Leaf4
base-lab_Spine1
base-lab_Spine2
lab-1
Rejected Keys:
```

Accept all keys
```console
salt-key -A 
root@lab-1:/arista_automation_events# salt-key -A
The following keys are going to be accepted:
Unaccepted Keys:
base-lab_Leaf1
base-lab_Leaf2
base-lab_Leaf3
base-lab_Leaf4
base-lab_Spine1
base-lab_Spine2
lab-1
Proceed? [n/Y] Y
Key for minion base-lab_Leaf1 accepted.
Key for minion base-lab_Leaf2 accepted.
Key for minion base-lab_Leaf3 accepted.
Key for minion base-lab_Leaf4 accepted.
Key for minion base-lab_Spine1 accepted.
Key for minion base-lab_Spine2 accepted.
Key for minion lab-1 accepted.
```

Test using test ping module on all devices and then test using the napalm net.cli module.
```console
root@lab-1:/arista_automation_events# salt '*' test.ping
base-lab_Leaf1:
    True
base-lab_Spine1:
    True
base-lab_Spine2:
    True
base-lab_Leaf3:
    True
base-lab_Leaf4:
    True
base-lab_Leaf2:
    True
lab-1:
    True

salt 'base*' net.cli 'show version'
root@lab-1:/arista_automation_events# salt 'base*' net.cli 'show version'
base-lab_Spine2:
    ----------
    comment:
    out:
        ----------
        show version:
             cEOSLab
            Hardware version:    
            Serial number:       
            System MAC address:  0242.ac27.cab4
            
            Software image version: 4.21.7M
            Architecture:           i386
            Internal build version: 4.21.7M-12794579.4217M
            Internal build ID:      3543fc10-c85c-4550-a140-4f49c479bda0
            
            cEOS tools version: 1.1
            
            Uptime:                 1 weeks, 6 days, 0 hours and 4 minutes
            Total memory:           32970880 kB
            Free memory:            15125632 kB
            
    result:
        True
```




