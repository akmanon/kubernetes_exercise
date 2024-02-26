#Install NFS utils according to the OS
sudo apt install nfs-kernel-server

#Creating Dir for the NFS
mkdir -p /data

#Change Ownership to Nobody
sudo chown nobody: /data

#Add the dir to the nfs config :: replace * with the client CIDR if required
echo "/data  *(rw,sync,no_subtree_check,insecure)" >> /etc/exports

#Run Exportfs command to use above dir as nfs
sudo exportfs -rav

#Restart the NFS
sudo systemctl restart nfs-kernel-server

#---------------------------------------------#

#On client check by mount the NFS

#Intall nfs util for the client
sudo apt install nfs-common

#Mount the NFS directory
sudo mount 172.30.1.2:/data /data

#To unmoun the NFS
sudo umount /data