#!/usr/bin/env bash
while :; 
	do 
		clear
		curl -silent http://flower.rhwi.net:5555/tasks\?limit\=100\&worker\=All\&type\=All\&state\=STARTED | grep -a1 -b1 seekers.tasks.resumes.fix_blank_resumes | grep "<td>" -a2
		sleep 60; 
done
