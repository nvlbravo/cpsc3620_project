#!/bin/bash

#Create MGT/MDT and mount (from root)
   #Format MGT
   mkfs.lustre --mgs /dev/sdb

   #Format MDT
   mkfs.lustre --fsname=lustre \
   --mgsnode=pc292.emulab.net@tcp --mdt --index=0 /dev/sdc

   #Mount MGT
   mkdir /mnt/mgt
   sudo mount –t lustre /dev/sdb /mnt/mgt

   #Mount MDT
   mkdir /mnt/mdt
   sudo mount –t lustre /dev/sdc /mnt/mdt
