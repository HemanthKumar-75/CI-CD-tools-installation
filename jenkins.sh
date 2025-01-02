#!/bin/bash

# install jenkins
curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install fontconfig java-17-openjdk jenkins -y

#resize disk from 20GB to 50GB
df -hT
lsblk
name=$(lsblk -dn -o NAME | head -n 1)
growpart /dev/$name 4
# growpart /dev/nvme0n1 4
df -hT

# resize logical volumes
lvextend -L +10G /dev/RootVG/rootVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

# resize filesystems
xfs_growfs /
xfs_growfs /var/tmp
xfs_growfs /var

# start jenkins
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins