#!/bin/sh
#Since there are several reboots, we found a way to access specific scripts within different phases of the configuration process

path='/project/'

if [ -e "$path"logs/clientStepLog.txt ]; then
  exists=`cat "$path"logs/clientStepLog.txt`
  if [ $exists = "1" ]; then
    #part 2
    sudo "$path"init/./part2.sh >> "$path"logs/clientPLog.txt 2>&1
    sudo echo "2" > "$path"logs/clientStepLog.txt
  elif [ $exists = "2" ]; then
    #part 3
    sudo "$path"lustre/./part3_client.sh >> "$path"logs/clientPLog.txt 2>&1
    sudo echo "3" > "$path"logs/clientStepLog.txt
  elif [ $exists = "3" ]; then
    #part 4
    sudo "$path"lustre/./part4_client.sh >> "$path"logs/clientPLog.txt 2>&1
    sudo echo "4" > "$path"logs/clientStepLog.txt
  elif [ $exists = "4" ]; then
    #part 5 mount
    #sudo "$path"mount/./mountClient.sh >> "$path"logs/clientPLog.txt 2>&1
    sudo echo "5" > "$path"logs/clientStepLog.txt
  elif [ $exists = "5" ]; then
    #end process
    sudo echo "done" >> "$path"logs/clientStepLog.txt
  fi<
else
  #part 1
  sudo touch "$path"logs/clientPLog.txt
  sudo touch "$path"logs/clientStepLog.txt
  sudo "$path"init/./part1.sh >> "$path"logs/clientPLog.txt 2>&1
  sudo echo "1" > "$path"logs/clientStepLog.txt
fi
