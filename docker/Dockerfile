FROM ubuntu:16.04

#Copy contents from the Git repo into the /OC directory
WORKDIR /arista_automation_events

COPY . /arista_automation_events

VOLUME /arista_automation_events

#Install necessary packages
RUN apt-get update && \
apt-get install wget python-pip python-dev git net-tools iputils-ping mtr vim curl -y

#Install necessary Python packages
RUN pip install futures ansible napalm-eos jsonrpclib

#using this to keep the container alive.
CMD tail -f /dev/null
