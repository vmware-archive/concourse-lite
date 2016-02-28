FROM concourse/atc-ci

# install virtualbox
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ vivid multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://archive.ubuntu.com/ubuntu/ vivid multiverse' >> /etc/apt/sources.list
RUN apt-get update && apt-get -y install virtualbox

# install Vagrant
RUN apt-get update && apt-get -y install vagrant
