#!/bin/bash

docker_status=$(systemctl is-active docker)
docker_version=$(docker --version | awk '{print $3}' | tr -d ',')
current_date=$(date)

subject="DOCKER STATUS ALERT MAIL"
to="gunaachar003@gmail.com"

echo -e "Docker_status on $(hostname) at $current_date is : $docker_status\nDocker version is : $docker_version"

if [ "$docker_status" != "active" ];
then
	echo -e "Docker status on $(hostname) at $current_date is : $docker_status" | mail -s "$subject : $docker_status" $to

sleep 5
systemctl restart docker

new_status=$(systemctl is-active docker)
new_date=$(date)

if [ "$new_status" == "active" ];
then
	echo -e "Docker restarted successfully on $(hostname) at $new_date. Docker is healthy" | mail -s "$subject : $new_status" $to
else
	echo -e "Docker restart unsuccessfully. Please look into it" | mail -s "$subject : $new_status" $to
fi
fi
