#!/bin/bash


<< comment

This is a script for backup with 5 days of rotation

Usage : 
./backup.sh <path to your source> <path to your backup folder> 

comment

function display_usage {
	echo "USAGE : ./backup.sh <path to your source> <path to your backup folder>"
}

if [ $# -eq 0 ]; then
	display_usage
fi

source_directory=$1
backup_directory=$2
timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

function create_backup {

	zip -r ${backup_directory}/backup_${timestamp}.zip ${source_directory}
	if [ $? -eq 0 ]; then
		echo "Backup generated successfully for ${timestamp}"
	fi

}

function perform_rotation {
    allBackups=($(ls -t "${backup_directory}/backup_"*.zip 2>/dev/null))

    if [ "${#allBackups[@]}" -gt 5 ]; then
        echo "Performing Rotation for 5 days"
        backups_to_remove=("${allBackups[@]:5}")

        for file in "${backups_to_remove[@]}"; do
            rm -f "$file"
            echo "Removed $file"
        done
    fi
}


create_backup
perform_rotation
