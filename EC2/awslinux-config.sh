#!/bin/bash -v

sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y unzip
sudo apt-get install python-pip -y > /tmp/python-pip.log
sudo apt-get install -y ansible > /tmp/ansible.log
sudo pip install debops
sudo pip install --upgrade debops
sudo debops-update
sudo apt-get install -y unzip
sudo wget https://github.com/tordenist/flugel_test/archive/master.zip
sudo unzip master.zip
sudo cd flugel_test-master
sudo mkdir -p /usr/share/ansible/plugins/lookup
sudo cp -p lookup_plugins/* /usr/share/ansible/plugins/lookup
sudo echo "lookup_plugins     = /usr/share/ansible/plugins/lookup" >> /etc/ansible/ansible.cfg
sudo ansible-playbook -i "localhost," -c local setup.yml
