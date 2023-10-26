FROM ubuntu:mantic
RUN apt-get update -y &&  apt-get install -y curl
ADD my-binary /opt
