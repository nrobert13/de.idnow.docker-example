#!/bin/bash -ex

cd de.idnow.example
./activator update compile dist
cd ..

#because dockerignore is not able to include parts of a wildcard exclude, we exclude everything but our package 
echo -e "build.sh\nrun.sh" > .dockerignore
find de.idnow.example/  ! -regex 'de.idnow.example/?\(target\)?/?\(universal\)?/?\(de-idnow-example-1.0-SNAPSHOT.zip\)?' >> .dockerignore

# now create the docker image
docker build -t nrobert/idnow-app .

#we don't need .dockerignore, as we generate it dynamically
rm -f .dockerignore

