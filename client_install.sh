#!/bin/bash
# Group 10 Client installation Script
# Source - http://cdn.opensfs.org/wp-content/uploads/2015/04/Lustre-101_Andrus.pdf

# Step 1 - ensure poper kernel is installed.

yum install kernel-2.6.32-504.8.1.el6.rpm


# Step 2 - grabbing client files.
wget https://downloads.hpdd.intel.com/public/lustre/lustre-
2.7.0/el6.6/client/RPMS/x86_64/lustre-client-2.7.0-2.6.32_504.8.1.el6.x86_64.x86_64.rpm

wget https://downloads.hpdd.intel.com/public/lustre/lustre-
2.7.0/el6.6/client/RPMS/x86_64/lustre-client-modules-2.7.0-
2.6.32_504.8.1.el6.x86_64.x86_64.rpm


# Step 3 - Install lustre client packages
yum install kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm
yum install lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm


#Step 4 - Add mount to /etc/fstab

#do stuff
#check


# Step 5 - Reboot
/sbin/shutdown -r now
