#!/bin/sh

# Install the nfs server package
apt-get install -y nfs-common
 # Change working dir to te home directory
cd
# Creating the directory where the remote shared
# files will be visible
mkdir /home/mpiuser/cloud
# Mounting the remote directory on behalf of mpi user
su -c "echo 'mpiuser' | sudo mount -t nfs master:/home/mpiuser/cloud /home/mpiuser/cloud" mpiuser

