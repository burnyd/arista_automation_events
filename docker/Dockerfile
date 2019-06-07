FROM ubuntu:16.04

#Install necessary packages
RUN apt-get update && \
apt-get install wget python3-pip python3-dev python-pip python-dev git net-tools iputils-ping mtr vim curl -y

#Install necessary Python packages
RUN pip install futures ansible napalm jsonrpclib

#using this to keep the container alive.
CMD tail -f /dev/null
