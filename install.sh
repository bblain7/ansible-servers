#!/bin/bash

if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running as root"
    exit
fi

DIR=$( dirname "$( readlink -f "$0" )" )
cd ${DIR}

software_dir="${HOME}/software"



# Install Packer
# -------------------------------------------------------------------

getPackerVersion() {
  echo "$( packer -v )"
}

packer_version="$( getPackerVersion )"
if [ -z ${packer_version+x} ]; then
  apt-get install unzip
  unzip -o "${software_dir}/packer/packer_0.10.1_linux_amd64.zip" -d "/usr/local/bin"

  packer_version="$( getPackerVersion )"
  if [ -z ${packer_version+x} ]; then
    echo "Packer ${packer_version} successfully installed."
  else
    echo "Packer was not installed."
    exit 1;
  fi
else
  echo "Packer ${packer_version} already installed."
fi



# Install Vagrant
# -------------------------------------------------------------------


getVagrantVersion() {
  echo "$( vagrant --version | awk '/^Vagrant/ {print $2}' )"
}

vagrant_version="$( getVagrantVersion )"
if [ -z ${vagrant_version+x} ]; then
  apt-get -y install "${software_dir}/vagrant/vagrant_1.8.5_x86_64.deb"

  vagrant_version="$( getVagrantVersion )"
  if [ -z ${vagrant_version+x} ]; then
    echo "Vagrant ${vagrant_version} successfully installed."
  else
    echo "Vagrant was not installed."
    exit 1;
  fi
else
  echo "Vagrant ${vagrant_version} already installed."
fi



# Install Ansible
# -------------------------------------------------------------------

getAnsibleVersion() {
  echo "$( ansible --version | awk '/^ansible/ {print $2}' )"
}

ansible_version="$( getAnsibleVersion )"
if [ -z ${ansible_version+x} ]; then
  apt-get install software-properties-common
  apt-add-repository ppa:ansible/ansible
  apt-get update
  apt-get install ansible

  ansible_version="$( getAnsibleVersion )"
  if [ -z ${ansible_version+x} ]; then
    echo "Ansible ${ansible_version} successfully installed."
  else
    echo "Ansible was not installed."
    exit 1;
  fi
else
  echo "Ansible ${ansible_version} already installed."
fi


# Install VirtualBox
# -------------------------------------------------------------------

getVirtualBoxVersion() {
  echo "$( vboxmanage --version )"
}

virtualbox_version="$( getVirtualBoxVersion )"
if [ -z ${virtualbox_version+x} ]; then
  apt-get -y install "${software_dir}/virtualbox/virtualbox-5.1_5.1.4-110228-Ubuntu-xenial_amd64.deb"

  virtualbox_version="$( getVirtualBoxVersion )"
  if [ -z ${virtualbox_version+x} ]; then
    echo "VirtualBox ${virtualbox_version} successfully installed."
  else
    echo "VirtualBox was not installed."
    exit 1;
  fi
else
  echo "VirtualBox ${virtualbox_version} already installed."
fi

