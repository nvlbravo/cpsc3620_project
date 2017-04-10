#!/bin/bash

   #kernel/firmware update and install
   yum update kernel-firmware -y
   yum install dracut-kernel -y

   #make entry in /etc/modprobe.d/lustre.conf
   #configure lnet option to configure ethernet/networked fs

   #find if file exists, if it does, write new option to file
   #if file does not exist create the file and write to it
   if [ ! -e /etc/modprobe.d/lustre.conf ]; then
      echo "options lnet networks=tcp(eth3)" > /etc/modprobe.d/lustre.conf
   else
      exists='cat /etc/sysconfig/selinux | grep options lnet networks'
      if [ exists ]; then
         sed -ie 's/options lnet networks.*$/options lnet networks=tcp(eth3)/' /etc/modprobe.d/lustre.conf
      else
         echo "options lnet networks=tcp(eth3)" >> /etc/modprobe.d/lustre.conf
      fi
   fi
