FROM codacy/base
MAINTAINER Rodrigo Fernandes <rodrigo@codacy.com>

# Install Ansible

RUN \
  apt-get -y update && \
  apt-get -y install python-software-properties && \
  apt-get -y install python && \
  apt-get -y install python-dev python-pip build-essential checkinstall libgmp3-dev libffi-dev \
    libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev && \
  apt-get -y install apparmor libdevmapper1.02.1 && \
  ln -s /lib/x86_64-linux-gnu/libdevmapper.so.1.02.1 /lib/x86_64-linux-gnu/libdevmapper.so.1.02 && \
	python -m pip install -I -U --upgrade pip && \
	\
	python -m pip install -I -U ansible==1.9.2 && \
  \
  apt-get -y remove --purge python-dev python-pip build-essential checkinstall libgmp3-dev libffi-dev \
    libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev && \
  apt-get purge -y $(apt-cache search '~c' | awk '{ print $2 }') && \
  apt-get -y autoremove && \
  apt-get -y autoclean && \
  apt-get -y clean all && \
  rm -rf /root/.cache/pip && \
  rm -rf /root/.pip/cache && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/apt && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  rm -rf /tmp/*
