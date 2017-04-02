#!/bin/bash
# Group 10 Installation Script
# Source - http://cdn.opensfs.org/wp-content/uploads/2015/04/Lustre-101_Andrus.pdf

# Step 1 - grabbing a bunch of files.
wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/e2fsprogs-1.42.12.wc1-7.el6.x86_64.rpm
wget https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/e2fsprogs-libs-1.42.12.wc1-7.el6.x86_64.rpm
wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm
wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/kernel-firmware-2.6.32-504.8.1.el6_lustre.x86_64.rpm
wget
https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/libcom_err-1.42.12.wc1-7.el6.x86_64.rpm
wget
https://downloads.hpdd.intel.com/public/e2fsprogs/1.42.12.wc1/el6/RPMS/x86_64/libss-1.42.12.wc1-7.el6.x86_64.rpm
wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-modules-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-osd-ldiskfs-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
wget
https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6/server/RPMS/x86_64/lustre-osd-ldiskfs-mount-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm

# Step 2 - Disable kernel and Lustre yum updates.
echo 'disable=kern*,lustre*' >> /etc/yum.conf

# Step 3 - Install kernel-firmware package
rpm -Uvh kernel-firmware-2.6.32-504.8.1.el6_lustre.x86_64.rpm

# Step 4 - Install lustre packages
yum install kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm
yum install lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install lustre-modules-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install lustre-osd-ldiskfs-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install lustre-osd-ldiskfsmount-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm
yum install e2fsprogs-1.42.12.wc1-7.el6.x86_64.rpm
yum install e2fsprogs-libs-1.42.12.wc1-7.el6.x86_64.rpm
yum install libcom_err-1.42.12.wc1-7.el6.x86_64.rpm
yum install libss-1.42.12.wc1-7.el6.x86_64.rpm


# Step 5 - Configure kernel module for TCP network
echo “options lnet networks=tcp” > /etc/modprobe.d/lnet.conf

# Step 6 - Configure services to auto start
chkconfig lnet --add
chkconfig lnet on
chkconfig lustre --add
chkconfig lustre on

# Step 7 - Reboot
/sbin/shutdown -r now
