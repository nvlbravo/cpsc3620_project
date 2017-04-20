#!/bin/bash

#create and mount OSS
   #format OST
   mkfs.lustre --fsname=lustre --ost --mgsnode={MGSIP}@tcp --index=0 /dev/sdb

   #mount OST
   sudo mkdir /mnt/ost0 
   sudo mount –t lustre /dev/sdb /mnt/ost0
