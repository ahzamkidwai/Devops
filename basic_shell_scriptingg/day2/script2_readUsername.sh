#!/bin/bash


read -p "Enter your username : " username

echo "Your username is $username"

sudo useradd -m $username

echo "New User has been added successfully!!!"

