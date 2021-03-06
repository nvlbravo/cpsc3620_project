#!/bin/bash

sudo echo "=== SETUP - PART 2 ==="

   #kernel/firmware update and install
   sudo yum update kernel-firmware -y
   sudo yum install dracut-kernel -y


   #make entry in /etc/modprobe.d/lustre.conf
   #configure lnet option to configure ethernet/networked fs

   #find if file exists, if it does, write new option to file
   #if file does not exist create the file and write to it
   if [ ! -e /etc/modprobe.d/lustre.conf ]; then
      sudo echo "options lnet networks=tcp(eth3)" > /etc/modprobe.d/lustre.conf
   else
      exists='cat /etc/sysconfig/selinux | grep options lnet networks'
      if [ exists ]; then
         sudo sed -ie 's/options lnet networks.*$/options lnet networks=tcp(eth3)/' /etc/modprobe.d/lustre.conf
      else
         sudo echo "options lnet networks=tcp(eth3)" >> /etc/modprobe.d/lustre.conf
      fi
   fi

   sudo reboot
