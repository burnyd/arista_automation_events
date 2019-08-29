#added salt pillars
#Changed the salt master config file with new pillar / file roots

FROM ubuntu:16.04

WORKDIR /arista_automation_events

COPY . /arista_automation_events

VOLUME /arista_automation_events

#Install necessary packages
RUN apt-get update && \
apt-get install wget python-cffi libxslt1-dev libffi-dev libssl-dev default-jre python3-pip python3-dev python-pip python-dev git net-tools iputils-ping mtr vim curl -y

#Install necessary Python packages
RUN pip install futures ansible napalm jsonrpclib
RUN pip install --upgrade pyOpenSSL

RUN mkdir -p /srv/salt/ && \
mkdir -p /srv/salt/pillar/ && \
mkdir -p /srv/salt/states/ && \
mkdir -p /srv/salt/templates/ && \
mkdir -p /srv/salt/states/leaf && \
mkdir -p /srv/salt/states/spine && \
mkdir -p /srv/salt/reactor/ && \
mkdir -p /etc/salt && \
cp /arista_automation_events/salt/scripts/salt/master /etc/salt/ && \
echo 127.0.0.1 salt  >> /etc/hosts

RUN wget -O bootstrap-salt.sh https://bootstrap.saltstack.com/ && sh bootstrap-salt.sh

#using this to keep the container alive.
CMD tail -f /dev/null
