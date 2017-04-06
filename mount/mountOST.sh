#!/bin/bash

#Create OSS (from root)
   #Format OST
   mkfs.lustre --fsname=lustre --ost \
   --mgsnode={MGSIP}@tcp --index=0 /dev/sdb

   #Mount OST
   mkdir /mnt/ost0 
   mount –t lustre /dev/sdb /mnt/ost0