#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/project/'

if [ -e "$path"logs/mgtStepLog.txt ]; then
  exists=`cat "$path"logs/mgtStepLog.txt`
  if [ $exists = "1" ]; then
    #part 2
    sudo "$path"init/./part2.sh >> "$path"logs/mgtPLog.txt 2>&1
    sudo echo "2" > "$path"logs/mgtStepLog.txt
  elif [ $exists = "2" ]; then
    #part 3
    sudo "$path"lustre/./part3_server.sh >> "$path"logs/mgtPLog.txt 2>&1
    sudo echo "3" > "$path"logs/mgtStepLog.txt
  elif [ $exists = "3" ]; then
    #part 4
    sudo "$path"lustre/./part4_server.sh >> "$path"logs/mgtPLog.txt 2>&1
    sudo echo "4" > "$path"logs/mgtStepLog.txt
  elif [ $exists = "4" ]; then
    #part 5 _mount
    # TODO - fix this
    #sudo "$path"mount/./mountMGT.sh >> "$path"logs/mgtPLog.txt 2>&1
    sudo echo "5" > "$path"logs/mgtStepLog.txt
  elif [ $exists = "5" ]; then
    #end process
    sudo echo "done" >> "$path"logs/mgtStepLog.txt
  fi
else
  #part 1
  sudo touch "$path"logs/mgtPLog.txt
  sudo touch "$path"logs/mgtStepLog.txt
  sudo "$path"init/./part1.sh >> "$path"logs/mgtPLog.txt 2>&1
  sudo echo "1" > "$path"logs/mgtStepLog.txt
fi
