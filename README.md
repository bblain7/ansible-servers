# Servers

The Servers project is a combination of Packer, Vagrant, and Ansible roles to build and work in a developer environment.

## Usage

Once software prerequisites are installed and configured, from the root of the project you will be able to use the standard Vagrant commands to startup all the virtual machines. The following command will create and deploy all the boxes available.

```bash
vagrant up
```

Likewise, you can specify to start each box individually by modifying the command.

```bash
vagrant up nexus
```

The servers included so far in this project include:

- Jenkins
- Sonarqube
- SonaType Nexus

Eventually, some of the servers may be dependent on other servers. The README file will be updated as configurations are improved.

# Getting Started

# Prerequisites

- Linux OS
- Virtualbox
- Packer
- Vagrant
- Ansible


As a side note I wasted some time with Vagrant on Windows 10. I would just use Linux OS to make it easier.

In order for Vagrant to work on Windows 10, install the Microsoft Visual C++ 2010 Redistributable Package (x86)


Also, as a reference for updating this README file later.
https://github.com/noffle/art-of-readme


