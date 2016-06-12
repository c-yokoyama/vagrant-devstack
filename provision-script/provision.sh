#!/bin/bash

# 初回のみ本スクリプトを実行
test -f /etc/provison && exit

sudo apt-get -y update
sudo apt-get -y install git vim
sudo apt-get install libffi-dev libssl-dev git vim libxml2-dev libsqlite3-dev libxslt1-dev -y

# timezoneの変更 
sudo  timedatectl set-timezone Asia/Tokyo

git clone https://git.openstack.org/openstack-dev/devstack
cd devstack

# ブランチの切り替え
git checkout -b stable/mitaka origin/stable/mitaka
# git checkout -b stable/liberty origin/stable/liberty

# stackユーザの作成
sudo ./tools/create-stack-user.sh

sudo chmod -R 777 ../devstack

echo "provision finished!!!"

date > /etc/provision
