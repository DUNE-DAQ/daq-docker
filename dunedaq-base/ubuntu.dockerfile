FROM ubuntu:22.04

ENV REFRESHED_ON 20231004

RUN apt update \
 && apt-get install -y  git python3-yaml build-essential gfortran wget tar zip \
    rsync patch lbzip2 texinfo file  keyutils libkeyutils-dev gcc-multilib g++-multilib libunwind-dev \
 && apt-get clean

ADD ubuntu-lib64.sh /usr/bin/ubuntu-lib64.sh
RUN /usr/bin/ubuntu-lib64.sh


ENTRYPOINT ["/bin/bash"]
