#!/bin/bash

   #create client and mount
   sudo mkdir /mnt/lustre
   sudo mount –t lustre 128.110.96.127@tcp:/lustre /mnt/lustre
