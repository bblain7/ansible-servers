#!/bin/bash


DIR=$(dirname "$(readlink -f "$0")")
cd ${DIR}

SOFTWARE_DIR="${HOME}/software"
PACKER_DIR="./packer"

apt-get -y install ansible packer vagrant



packer build ${PACKER_DIR}/ubuntu-16.04.json || {
  echo "Packer failed to create Vagrant box.";
  exit 1;
}

vagrant box add --force ${USER}/ubuntu-server-16.04 ${DIR}/.vagrant/boxes/virtualbox-ubuntu-16.04.box || {
  echo "Vagrant failed to add box.";
  exit 1;
}

