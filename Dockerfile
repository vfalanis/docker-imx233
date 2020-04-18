FROM ubuntu:12.04

ENV HOME /root

WORKDIR /root

RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    make \
    net-tools \
    bzip2 \
    ssh \
    nano \
    gcc-multilib

COPY install.sh $HOMEDIR/install.sh
RUN chmod +x $HOMEDIR/install.sh
RUN $HOMEDIR/install.sh
