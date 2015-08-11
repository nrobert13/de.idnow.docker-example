#!/bin/bash

#run the container with port 9000 exposed and mapped to host, in order to be able to accept incomming requestes from nginx
docker run -it --rm -p 9000:9000 nrobert/idnow-app
