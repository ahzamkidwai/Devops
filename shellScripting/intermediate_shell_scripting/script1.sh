#!/bin/bash


<< comment
Error Handling Part-1
comment

# Function Definition
function create_directory(){
	mkdir demo
}

# Function Call
if ! create_directory; then 
	echo "The code is been exited as the directory demo already exists"
	exit 1
fi

echo "Folder demo created successfully!!!"

<< throwError
echo "For the first time, it will create a directory with name demo, no when this function call takes for the second time, it gives error because demo folder is already created"
throwError
