#!/bin/bash
# Execute this script if initial deployment
sudo test -f /etc/provison && exit

sudo apt-get -y update
sudo apt-get -y install git vim

# Change timezone
sudo timedatectl set-timezone Asia/Tokyo

git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
# Change branch
git checkout -b stable/ocata origin/stable/ocata

echo "Provision finished"
sudo sh -c "date > /etc/provision"

