#!/bin/bash

sudo echo "=== SETUP - PART 3 ==="

# Install Lustre
   #1. Downloads Lustre server kernel
   wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6.6/server/RPMS/x86_64/kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm --no-check-certificate

   #2. Installs RPM
   sudo rpm -ivh kernel-2.6.32-504.8.1.el6_lustre.x86_64.rpm

   #3. Installs kernel
   /sbin/new-kernel-pkg --package kernel --mkinitrd \
   --dracut --depmod \
   --install 2.6.32-504.8.1.el6_lustre.x86_64

   sudo reboot
