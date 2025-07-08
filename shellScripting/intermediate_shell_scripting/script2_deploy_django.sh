#!/bin/bash


<< task
Deploy django app and handle errors carefully 
task

# Function Definition
code_clone(){
	echo "Cloning the Django App..."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

# Function to install packages used in the above project
install_requirements(){
	echo "Installing Dependencies..."
	sudo apt-get install docker.io nginx -y docker-compose
}

# Function to restart 
required_restarts(){
	echo "Required Restarts..."
	sudo chown $USER /var/run/docker.sock
	# sudo systemctl enable docker
	# sudo systemctl enable nginx
	# sudo systemctl restart docker
}

# Function deploy
deploy(){
	docker build -t notes-app .
	# docker run -d -p 8000:8000 notes-app:latest
	docker-compose up -d
}

echo "*************************************** DEPLOYMENT STARTED **********************************"

if ! code_clone; then 
	echo "THE CODE DIRECTORY ALREADY EXISTS"
	cd django-notes-app
fi

if ! install_requirements; then 
	echo "INSTALLATION FAILED"
	exit 1
fi

if ! required_restarts; then
	echo "SYSTEM FAULT IDENTIFIES"
	exit 1
fi


if ! deploy; then
	echo "DEPLOYMENT FAILED"
	sendMail
	exit 1
fi

echo "************************************ DEPLOYMENT FINISHED SUCCESSFULLY *******************************"
