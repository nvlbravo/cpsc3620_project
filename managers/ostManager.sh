#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/users/nbravo/project/'

if [ -e "$path"ostStepLog.txt ]; then
  exists=`cat "$path"ostStepLog.txt`
  if [ $exists = "1" ]; then
    #part 2
    sudo "$path"part2.sh >> "$path"ostPLog.txt 2>&1
    echo "2" > "$path"ostStepLog.txt
  elif [ $exists = "2" ]; then
    #part 3
    sudo "$path"part3(server).sh >> "$path"ostPLog.txt 2>&1
    echo "3" > "$path"ostStepLog.txt
  elif [ $exists = "3" ]; then
    #part 4
    sudo "$path"part4(server).sh >> "$path"ostPLog.txt 2>&1
    echo "4" > "$path"ostStepLog.txt
  elif [ $exists = "4" ]; then
    #part 5 (mount)
    sudo "$path"mountOST.sh >> "$path"ostPLog.txt 2>&1
    echo "5" > "$path"ostStepLog.txt
  elif [ $exists = "5" ]; then
    #end process
    echo "done" >> "$path"ostStepLog.txt
  fi
else
  #part 1
   sudo "$path"part1.sh >> "$path"ostPLog.txt 2>&1
   echo "1" > "$path"ostStepLog.txt
fi
