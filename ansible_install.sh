#!/bin/bash

# Update the system
sudo yum update -y

# Install EPEL repository (Extra Packages for Enterprise Linux)
sudo yum install -y epel-release

# Install Python and pip
sudo yum install -y python3 python3-pip

# Install Ansible
sudo pip3 install ansible

# Verify Ansible installation
ansible --version

