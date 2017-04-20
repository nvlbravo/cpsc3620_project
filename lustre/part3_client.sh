#!/bin/bash

sudo echo "=== SETUP - PART 3 ==="

#install Lustre

   #1. downloads Lustre client kernel
   wget ftp://mirror.switch.ch/pool/4/mirror/scientificlinux/6.3/x86_64/updates/security/kernel-2.6.32-504.8.1.el6.x86_64.rpm

   #2. installs rpm
   sudo rpm -ivh --force kernel-2.6.32-504.8.1.el6.x86_64.rpm

   #3. installs kernel
   /sbin/new-kernel-pkg --package kernel --mkinitrd --dracut --depmod --install 2.6.32-504.8.1.el6.x86_64

   sudo reboot
