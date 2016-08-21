#!/bin/bash

ifconfig

# Add vagrant user to sudoers.
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
