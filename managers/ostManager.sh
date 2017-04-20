#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/users/nbravo/project/'

if [ -e "$path"log/ostStepLog.txt ]; then
  exists=`cat "$path"log/ostStepLog.txt`
  if [ $exists = "1" ]; then
    #part 2
    sudo "$path"init/./part2.sh >> "$path"log/ostPLog.txt 2>&1
    echo "2" > "$path"log/ostStepLog.txt
  elif [ $exists = "2" ]; then
    #part 3
    sudo "$path"lustre/./part3(server).sh >> "$path"log/ostPLog.txt 2>&1
    echo "3" > "$path"log/ostStepLog.txt
  elif [ $exists = "3" ]; then
    #part 4
    sudo "$path"lustre/./part4(server).sh >> "$path"log/ostPLog.txt 2>&1
    echo "4" > "$path"log/ostStepLog.txt
  elif [ $exists = "4" ]; then
    #part 5 (mount)
    # TODO - fix this
    #sudo "$path"mount/./mountOST.sh >> "$path"log/ostPLog.txt 2>&1
    echo "5" > "$path"log/ostStepLog.txt
  elif [ $exists = "5" ]; then
    #end process
    echo "done" >> "$path"log/ostStepLog.txt
  fi
else
  #part 1
   sudo "$path"init/./part1.sh >> "$path"log/ostPLog.txt 2>&1
   echo "1" > "$path"log/ostStepLog.txt
fi