#!/bin/bash

#create MGT/MDT and mount

   #format combined MDT MGS
   mkfs.lustre --mgs --mdt --fsname=lustre --index=0 /dev/sdb

   #mount MGT/MDT
   sudo mkdir /mnt/mgsmdt
   sudo mount -t lustre /dev/sdb /mnt/mgsmdt
