#!/usr/bin/bash


#check if both source and destination directories are provided
if [ $# -ne 2 ]; then
	echo "usage: $0 <source_directory> <destination_directory>"
	exit 1
fi


#Assigning arguments to variables
source_dir=$1
destination_dir=$2


#Check if source directory exist
if [ ! -d "$source_dir" ]; then
	echo "source directory does not exist"
	exit 1
fi


#check if destination directory exist, if not create it
if [ ! -d "$destination_dir" ]; then
	mkdir -p "$destination_dir"
fi


#Creating tar archive with timestamp
timestamp=$(date +%Y%m%d_%H%M%S)
backup_file="$destination_dir/backup_$timestamp.tar.gz"


#Creating a backup
tar -czf "backup_file" "$source_dir"


#check if backup was successful
if [ $? -eq 0 ]; then
	echo "Backup created successfully: $backup_file"
else
	echo "Backup failed"
fi

