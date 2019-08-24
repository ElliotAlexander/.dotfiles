#!/bin/bash

echo "Setting up ssh"
mkdir ~/.ssh
cat ../id.pub | ~/.ssh/authorized_keys

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod -R go= ~/.ssh


cp ./sshd_config /etc/ssh/sshd_config

yum update && yum install -y policycoreutils-python

semanage port -a -t ssh_port_t -p tcp 6022
firewall-cmd --add-port=6022/tcp --permanent
firewall-cmd --reload


sudo systemctl restart sshd.service
