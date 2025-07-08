#!/bin/bash

# This is single line comment - LOOPS
<< comment 
We wil create 5 new folders 
comment

<< task 
$3 is the folder name 
$1 is the starting range
$2 is the ending range
Make sure that starting range is always less than equal to ending range
task

if [[ $1 -le $2 ]];
then

	for (( i = $1; i <= $2; i++ ));
	do 
		mkdir "$3-$i"
	done
	echo "Folders $3-$1 to $3-$2 created successfully"

else 
	echo "Error: Stating that starting range must be less that ending range"
fi
