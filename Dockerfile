# MariaDB (https://mariadb.org/)

FROM ubuntu:precise
MAINTAINER Glen Wilson <synergy.oz@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Ensure UTF-8
RUN apt-get update
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Install MariaDB from repository.
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install python-software-properties && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
    apt-get update && \
    apt-get install -y haproxy

# Install other tools.
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y pwgen inotify-tools openssh-server rsync vim telnet

ADD ssh /root/.ssh
ADD etc-haproxy /etc/haproxy
ADD scripts /scripts

RUN mkdir /var/run/sshd
RUN chmod +x /scripts/start.sh
 

ENTRYPOINT ["/scripts/start.sh"]
