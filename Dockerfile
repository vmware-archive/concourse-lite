FROM ubuntu:14.04

# build-essential      : for building virtualbox's vboxdrv
# unzip                : for installing packer
# golang git mercurial : for building packer-bosh
RUN apt-get update && apt-get -y install build-essential unzip golang git mercurial

# install virtualbox
ADD http://download.virtualbox.org/virtualbox/4.3.18/virtualbox-4.3_4.3.18-96516~Ubuntu~raring_amd64.deb /tmp/virtualbox.deb
RUN dpkg -i /tmp/virtualbox.deb || apt-get -y -f install
RUN rm /tmp/virtualbox.deb

# set up directories/env for packer + packer-bosh
RUN mkdir -p /opt/local/bin /opt/local/go
ENV GOPATH /opt/local/go
ENV PATH /opt/local/bin:/opt/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# install packer
ADD https://dl.bintray.com/mitchellh/packer/packer_0.7.2_linux_amd64.zip /tmp/packer.zip
RUN unzip -d /opt/local/bin /tmp/packer.zip && rm /tmp/packer.zip

# install and configure packer-bosh provisioner
ADD box-setup/install-packer-bosh /tmp/install-packer-bosh
ADD box-setup/packerconfig /opt/local/packerconfig
RUN /tmp/install-packer-bosh /opt/local/bin && rm /tmp/install-packer-bosh
ENV PACKER_CONFIG /opt/local/packerconfig
