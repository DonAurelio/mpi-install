#!/bin/sh

# Install the nfs server package
apt-get install nfs-common
 # Change working dir to te home directory
cd
# Creating the directory where the remote shared
# files will be visible
mkdir cloud
# Mount the remote shared directory
sudo mount -t nfs master:/home/mpiuser/cloud /home/mpiuser/cloud
