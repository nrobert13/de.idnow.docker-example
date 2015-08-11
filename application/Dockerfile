FROM ubuntu:14.04

# For add-apt-repository
RUN apt-get install -q -y software-properties-common
RUN apt-get install -q -y unzip

# Install Java 8
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys C43C79AD && gpg -a --export C43C79AD | apt-key add -
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
RUN apt-get install -q -y oracle-java8-installer

# Add the dist package of de.idnow.example from de.idnow.example/target/universal/de-idnow-example-1.0-SNAPSHOT.zip
RUN mkdir /opt/idnow
ADD de.idnow.example/target/universal/de-idnow-example-1.0-SNAPSHOT.zip /opt/idnow/

# Start the play netty server on image start
RUN ["unzip","/opt/idnow/de-idnow-example-1.0-SNAPSHOT.zip","-d","/opt/idnow/"]
ENTRYPOINT ["/opt/idnow/de-idnow-example-1.0-SNAPSHOT/bin/de-idnow-example"]
