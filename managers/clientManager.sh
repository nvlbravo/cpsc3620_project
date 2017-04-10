#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/users/nbravo/project/'

if [ -e "$path"clientStepLog.txt ]; then
  exists=`cat "$path"clientStepLog.txt`
  if [ $exists = "1" ]; then
    #part 2
    sudo "$path"part2.sh >> "$path"clientPLog.txt 2>&1
    echo "2" > "$path"clientStepLog.txt
  elif [ $exists = "2" ]; then
    #part 3
    sudo "$path"part3(client).sh >> "$path"clientPLog.txt 2>&1
    echo "3" > "$path"clientStepLog.txt
  elif [ $exists = "3" ]; then
    #part 4
    sudo "$path"part4(client).sh >> "$path"clientPLog.txt 2>&1
    echo "4" > "$path"clientStepLog.txt
  elif [ $exists = "4" ]; then
    #part 5 (mount)
    sudo "$path"mountClient.sh >> "$path"clientPLog.txt 2>&1
    echo "5" > "$path"clientStepLog.txt
  elif [ $exists = "5" ]; then
    #end process
    echo "done" >> "$path"clientStepLog.txt
  fi
else
  #part 1
   sudo "$path"part1.sh >> "$path"clientPLog.txt 2>&1
   echo "1" > "$path"clientStepLog.txt
fi
