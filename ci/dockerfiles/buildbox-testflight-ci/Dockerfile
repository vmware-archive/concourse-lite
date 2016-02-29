FROM concourse/atc-ci

# install virtualbox
RUN echo 'deb http://download.virtualbox.org/virtualbox/debian vivid contrib' >> /etc/apt/sources.list
RUN apt-get update && apt-get -y --force-yes install virtualbox-5.0

# for making Virtualbox's hostonlyifs work since it shells to ifconfig
RUN apt-get update && apt-get -y install net-tools

# install Vagrant
RUN apt-get update && apt-get -y install vagrant
