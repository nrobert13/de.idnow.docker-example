#!/bin/bash -ex

usage="Usage: $0 <valid IP address of the listening app>"

#check if there is an argument 
if [ $# -ne 1 ] ; then
	echo $usage
	exit 1
fi
#check if the arg is a valid IP address 
oIFS=$IFS
IFS="."
arr=($1)
IFS=$oIFS
for i in "${!arr[@]}" 
do
	if [ $i -gt 3 ] || [ ${arr[$i]} -gt 255 ] ; then
		echo $usage
		exit 1
	fi
	
done

#run the container with port 80 exposed and mapped to the host so it's accesible
docker run -it --rm -p 80:80 docker-example-nginx-proxy $1
