#!/bin/bash
for thirdoc in {1..32}; do
    for fourthoc in {1..254}; do
        route add -net 20.1.$thirdoc.$fourthoc netmask 255.255.255.255 gw 172.16.200.2
        echo " Adding 20.1.$thirdoc.$fourthoc "
    done
done
