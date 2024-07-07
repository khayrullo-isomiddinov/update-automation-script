#!/bin/bash

if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

targetDirectory=$1
destinationDirectory=$2

echo "target directory is $targetDirectory"
echo "destination directory is $destinationDirectory"

currentTS=`date +%s`
backupFileName="backup-[$currentTS].tar.gz"

origAbsPath=`pwd`

cd $destinationDirectory
destDirAbsPath=`pwd`

cd $origAbsPath
cd $targetDirectory

yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

for file in $(ls) # [TASK 9]
do
  if [[ `date -r $file +%s` -gt $yesterdayTS ]]
  then
    toBackup+=($file)
  fi
done

tar -czvf $backupFileName ${toBackup[@]}

mv $backupFileName $destDirAbsPath
