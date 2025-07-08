#!/bin/bash

<< comment
While loop
comment

num=5

while [[ $num -ge 0 ]]
do
	echo "Testing while loop : $num"
	((num--))
done

num=0

while [[ $num -le 10 ]]
do
	if (( $num%2 == 0 ));
	then
		echo "Number is $num "
	fi
	((num++))	
done
