#!/usr/bin/bash

#function to display usage information
option(){
	echo "option: $0 [-d] [-n N] directory"
	echo "options:"
	echo " -d: List all files and directories within the specified directory"
	echo " -n N: Return the top N entries (default is 8)"
	exit 1
}



#Default values for top N entries
N=8


#parse options
while getopts ":dn:" opt; do
	case ${opt} in
		d)
			listfiles=true
			;;
		n)
			N=$OPTARG
			;;
		\?)
			echo "Invalid option: -$OPTARG" 1>&2
			option
			;;
	esac
done

shift $((OPTIND -1))

#check if directory exist
if [ ! -d "$1" ]; then
	echo "Error: $1 does not exist."
	exit 1
fi

#list directories and files based on options
if [ "$listfiles" = true ]; then
	du -ah "$1" | sort -rh | head -n "$N"
else
	du -h "$1" | sort -rh | head -n "$N"
fi


