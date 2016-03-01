FROM concourse/atc-ci

# install virtualbox
RUN echo 'deb http://download.virtualbox.org/virtualbox/debian vivid contrib' >> /etc/apt/sources.list
RUN apt-get update && apt-get -y --force-yes install virtualbox-5.0

# install 'lsmod' so virtualbox can detect vboxdrv module is loaded
# have to install oder libkmod2 package for this atm
RUN apt-get -y --force-yes install libkmod2=18-3ubuntu1 module-init-tools

# for making Virtualbox's hostonlyifs work since it shells to ifconfig
RUN apt-get update && apt-get -y install net-tools

# install Vagrant
RUN wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb -O /tmp/vagrant.deb && \
      dpkg -i /tmp/vagrant.deb
