#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/users/nbravo/project/'

if [ -e "$path"clientStepLog.txt ]; then
   exists ='cat $path"clientStepLog.txt | grep 1'
   exists2 = 'cat $path"clientStepLog.txt | grep 2'
   exists3 = 'cat $path"clientStepLog.txt | grep 3'
   exists4 = 'cat $path"clientStepLog.txt | grep 4'
   exists5 = 'cat $path"clientStepLog.txt | grep 5'
   if[exists]; then
      #part 2
      sudo "$path"part2.sh | -a "$path"clientpLog.txt
      echo "2" > "$path"clientStepLog.txt
   elif [exists2]; then
      #part 3
      sudo "$path"part3(client).sh | tee -a "$path"clientPLog.txt
      echo "3" > "$path"clientStepLog.txt
   elif [exists3]; then
      #part 4
      sudo "$path"part4(client).sh | -a "$path"clientPLog.txt
      echo "4" > "$path"clientStepLog.txt
   elif [exists4]; then
      #part 5 (mount)
      sudo "$path"mountClient.sh | -a "$path"clientPLog.txt
      echo "5" > "$path"clientStepLog.txt
   elif [exists5]; then
      #end process
      echo "done" >> "$path"clientStepLog.txt
else
  #part 1
   sudo "$path"part1.sh | -a "$path"clientPLog1.txt
   echo "1" >> "$path"clientStepLog.txt
fi
