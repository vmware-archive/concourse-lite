FROM ubuntu:16.04

# add sources for virtualbox
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ xenial multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://archive.ubuntu.com/ubuntu/ xenial multiverse' >> /etc/apt/sources.list

# virtualbox           : for building the images
# unzip                : for installing packer
# golang git mercurial : for building packer-bosh
RUN apt-get update && apt-get -y install virtualbox unzip

# install packer
ADD https://releases.hashicorp.com/packer/0.10.0/packer_0.10.0_linux_amd64.zip /tmp/packer.zip
RUN unzip -d /opt/local/bin /tmp/packer.zip && rm /tmp/packer.zip
