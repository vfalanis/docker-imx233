FROM ubuntu:12.04

ENV HOME /root

WORKDIR /root

RUN apt-get update && apt-get install -y \
    software-properties-common \
    python-software-properties \
    gcc \
    g++ \
    make \
    net-tools \
    bzip2 \
    ssh \
    nano \
    flex \
    bison \
    bc \
    libssl-dev \
    gcc-multilib

RUN add-apt-repository -y ppa:git-core/ppa
RUN apt-get update && apt-get install -y git

COPY install.sh $HOMEDIR/install.sh
RUN chmod +x $HOMEDIR/install.sh
RUN $HOMEDIR/install.sh
