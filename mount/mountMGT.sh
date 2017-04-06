#!/bin/bash

#Create MGT/MDT and mount (from root) 
   #Format MGT
   mkfs.lustre --mgs /dev/sdb

   #Format MDT
   mkfs.lustre --fsname=lustre \
   --mgsnode={MGSIP}@tcp --mdt --index=0 /dev/sdc
   
   #Mount MGT
   mkdir /mnt/mgt
   mount –t lustre /dev/sdb /mnt/mgt
   
   #Mount MDT
   mkdir /mnt/mdt
   mount –t lustre /dev/sdc /mnt/mdt