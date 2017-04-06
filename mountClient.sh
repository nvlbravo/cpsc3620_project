#!/bin/bash

#Create Client and mount (from root)
   #Mount lustre fs
   mkdir /mnt/lustre
   mount –t lustre {MGSIP}@tcp:/lustre /mnt/lustre

