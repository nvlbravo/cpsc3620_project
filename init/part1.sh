#!/bin/bash
#Source: http://lustre.ornl.gov/lustre101-courses/content/C1/L3/LustreBasicInstall.pdf

#server and client init
   #write to sysconfig/selinux and disable SELINUX flag

   #if file doesn't exist create file and write to
   if [ ! -e /etc/sysconfig/selinux ]; then
      echo "SELINUX=disabled" > /etc/sysconfig/selinux
   else
      #if file does exist search for SELINUX in file, and set to disabled
      exists='cat /etc/sysconfig/selinux | grep SELINUX'
      if [ exists ]; then
         sed -ie 's/SELINUX=.*$/SELINUX=disabled/' /etc/sysconfig/selinux
      else
      #if SELINUX tag does not exist in file add tag, and disable
         echo "SELINUX=disabled" >> /etc/sysconfig/selinux
      fi
   fi

   #disable iptables
   chkconfig --levels 345 iptables off
   chkconfig --levels 345 ip6tables off

   reboot