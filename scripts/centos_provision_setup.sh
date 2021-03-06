#!/bin/bash

echo "Setting up ssh"
mkdir ~/.ssh
cat ../id.pub > ~/.ssh/authorized_keys

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod -R go= ~/.ssh


sudo cp ./sshd_config /etc/ssh/sshd_config

sudo yum update && sudo yum install -y policycoreutils-python

sudo semanage port -a -t ssh_port_t -p tcp 6022
sudo firewall-cmd --add-port=6022/tcp --permanent

sudo firewall-cmd --remove-service=ssh
sudo firewall-cmd --reload


sudo systemctl restart sshd.service

