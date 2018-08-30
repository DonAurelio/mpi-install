#!/bin/sh

# Install the nfs server package
apt-get install nfs-kernel-server
# Change working dir to te home directory
cd 
# Creating the shared directory
mkdir cloud
# Indicating the directory that will be shared
sed -e '/home/mpiuser/cloud *(rw,sync,no_root_squash,no_subtree_check)' -ibak /etc/exports
# Exporting shared directories
exportfs -a
# Restarting the NFS server
service nfs-kernel-server restart