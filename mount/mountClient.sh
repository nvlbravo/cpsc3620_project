#!/bin/bash

#Create Client and mount (from root)
   #Mount lustre fs
   mkdir /mnt/lustre
   sudo mount –t lustre 128.110.96.127@tcp:/lustre /mnt/lustre

