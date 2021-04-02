echo -e "Adding salt local host"
echo "
127.0.0.1 salt
" >> /etc/hosts

echo -e "Preparing Salt minion configuration"
echo "
master: localhost
pki_dir: /etc/salt/pki/proxy
cachedir: /var/cache/salt/proxy
multiprocessing: False
" >> /etc/salt/proxy

echo -e "Starting salt master and minion"
service salt-master start &
service salt-minion start &

echo -e "Starting proxy minions"
salt-proxy --proxyid=base_lab_Leaf1 &
salt-proxy --proxyid=base_lab_Leaf2 &
salt-proxy --proxyid=base_lab_Leaf3 &
salt-proxy --proxyid=base_lab_Leaf4 &
salt-proxy --proxyid=base_lab_Spine1 &
salt-proxy --proxyid=base_lab_Spine2 &
