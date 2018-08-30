#!/bin/sh

# Install the SSH server
apt-get install -y openssh-server
# %1 is the IP address of the master node
echo "${%1}    slave" >> /etc/hosts
# Adding an MPI user to run MPI jobs
adduser --disabled-password --gecos "" mpiuser
echo "mpiuser:mpiuser" | chpasswd
# Running the ssh service
service ssh start
# SSHPASS allor to pass the password to the ssh command
# without user interaction
apt-get install sshpass

# Login as mpi user 
su - mpiuser
# Creationg the public and private keys
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
# Avoid checking if the remote host is reliable
echo "StrictHostKeyChecking=no" >> ~/.ssh/config
# Sharing the public key with the remote slave
sshpass -p 'mpiuser' ssh-copy-id slave #ip-address may also be used
# Sharing the public key with myself
sshpass -p 'mpiuser' ssh-copy-id localhost #ip-address may also be used

