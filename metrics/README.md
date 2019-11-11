# Arista Salt stack
![Alt text](../images/grafana.jpg?raw=true "lab")

Repo for playing with openconfig metrics using telegraf, influxdb and grafana.

Please read the Readme for getting started on the repo [Readme](https://github.com/burnyd/arista_automation_events/blob/master/README.md)
```console

docker-topo --create base-lab.yml #From the root of the arista_automation_events repo
```

Run the following container as well exposing port 3000

```console

ocker run -dit -p 3000:3000 --network=base_lab_net-0 arista_automation_events_metrics:latest
```

Give it a few minutes and exec into the burnyd/arista_automation_events:latest container and run ansible playbooks to configure bgp.

```console
docker exec -it burnyd/arista_automation_events:latest bash
cd ansible
ansible-playbook -i inventory/bgp-evpn/leaf_bgp2.yaml && ansible-playbook -i inventory/bgp-evpn/spine_bgp2.yaml
```

Open up a web browser to localhost:3000 you should use admin/admin and go to the network-metrics portion to start streaming openconfig information.
