#!/bin/bash

<<comment
This is for conditionals
comment

read -p "What is the capital city of country India? " capitalCity

if [[ $capitalCity == "Delhi" ]];
then
	echo "Yes, you are correct! $capitalCity is the capital of country India."
elif [[ $capitalCity == "New Delhi" ]];
then
	echo "Yes, Only $capitalCity is the capital of India, but Delhi includes $captialCity"
else
	
	echo "No, $capitalCity is not the capital of country India"
fi

