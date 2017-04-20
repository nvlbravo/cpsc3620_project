#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/project/'

if [ -e "$path"log/mgtStepLog.txt ]; then
  exists=`cat "$path"log/mgtStepLog.txt`
  if [ $exists = "1" ]; then
    #part 2
    sudo "$path"init/./part2.sh >> "$path"log/mgtPLog.txt 2>&1
    sudo echo "2" > "$path"log/mgtStepLog.txt
  elif [ $exists = "2" ]; then
    #part 3
    sudo "$path"lustre/./part3(server).sh >> "$path"log/mgtPLog.txt 2>&1
    sudo echo "3" > "$path"log/mgtStepLog.txt
  elif [ $exists = "3" ]; then
    #part 4
    sudo "$path"lustre/./part4(server).sh >> "$path"log/mgtPLog.txt 2>&1
    sudo echo "4" > "$path"log/mgtStepLog.txt
  elif [ $exists = "4" ]; then
    #part 5 (mount)
    # TODO - fix this
    #sudo "$path"mount/./mountMGT.sh >> "$path"log/mgtPLog.txt 2>&1
    sudo echo "5" > "$path"log/mgtStepLog.txt
  elif [ $exists = "5" ]; then
    #end process
    sudo echo "done" >> "$path"log/mgtStepLog.txt
  fi
else
  #part 1
   sudo "$path"init/./part1.sh >> "$path"log/mgtPLog.txt 2>&1
   sudo echo "1" > "$path"log/mgtStepLog.txt
fi
