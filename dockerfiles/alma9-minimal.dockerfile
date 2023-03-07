# This Dockerfile is used to build an headles vnc image based on Centos

FROM almalinux:9

ENV REFRESHED_AT 2023-02-27

RUN yum clean all \
 && yum -y install epel-release dnf-plugins-core \
 && yum -y upgrade \
 && dnf config-manager --set-enabled crb \
 && yum clean all

# Tools for building the DAQ release
RUN yum -y install git make glibc-devel \
    openssl-devel xz-devel bzip2-devel libcurl-devel libunwind-devel \
    openssl  compat-openssl11 cyrus-sasl-devel xxhash-libs xxhash bzip2 \
 && yum clean all

# Common system tools requried to run various bash scripts
RUN yum clean all \
 && yum -y install \
    wget tar zip rsync openssh-server numactl-devel \
 && yum clean all

RUN yum clean all \
 && yum -y install \
    texinfo patch libbsd-devel \
 && yum clean all
 
RUN mkdir -p /dunedaq/run && chmod go+rw /dunedaq/run

ENTRYPOINT ["/bin/bash", "-l", "-c" ]
