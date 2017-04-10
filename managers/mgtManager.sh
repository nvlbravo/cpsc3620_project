#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/users/nbravo/project/'

if [ -e "$path"mgtStepLog.txt ]; then
   exists ='cat $path"mgtStepLog.txt | grep 1'
   exists2 = 'cat $path"mgtStepLog.txt | grep 2'
   exists3 = 'cat $path"mgtStepLog.txt | grep 3'
   exists4 = 'cat $path"mgtStepLog.txt | grep 4'
   exists5 = 'cat $path"mgtStepLog.txt | grep 5'
   if[exists]; then
      #part 2
      sudo "$path"part2.sh | -a "$path"mgtpLog.txt
      echo "2" > "$path"mgtStepLog.txt
   elif [exists2]; then
      #part 3
      sudo "$path"part3(server).sh | tee -a "$path"mgtPLog.txt
      echo "3" > "$path"mgtStepLog.txt
   elif [exists3]; then
      #part 4
      sudo "$path"part4(server).sh | -a "$path"mgtPLog.txt
      echo "4" > "$path"mgtStepLog.txt
   elif [exists4]; then
      #part 5 (mount)
      sudo "$path"mountMGT.sh | -a "$path"mgtPLog.txt
      echo "5" > "$path"mgtStepLog.txt
   elif [exists5]; then
      #end process
      echo "done" >> "$path"mgtStepLog.txt
else
  #part 1
   sudo "$path"part1.sh | -a "$path"mgtPLog1.txt
   echo "1" >> "$path"mgtStepLog.txt
fi