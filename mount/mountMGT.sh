#!/bin/bash

#Create MGT/MDT and mount (from root)
   #Format combined MDT MGS
   mkfs.lustre --mgs --mdt --fsname=lustre --index=0 /dev/sdb

  # Format MDT (NOPE)
  #  mkfs.lustre --fsname=lustre \
  #  --mgsnode=pc304.emulab.net@tcp --mdt --index=0 /dev/sdc

   #Mount MGT/MDT
   sudo mkdir /mnt/mgsmdt
   sudo mount -t lustre /dev/sdb /mnt/mgsmdt
