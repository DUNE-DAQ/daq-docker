# This Dockerfile is used to build an headles vnc image based on Centos

FROM almalinux:9

ENV REFRESHED_AT 2021-11-18

ENV UPS_OVERRIDE="-H Linux64bit+4.18-2.28"

# Tools for building the DAQ release

RUN yum clean all \
 && yum -y install epel-release \
 && yum -y update \
 && yum --enablerepo=powertools -y install git \
    make redhat-lsb-core glibc-devel \
    openssl-devel xz-devel bzip2-devel libcurl-devel libunwind-devel \
    openssl  compat-openssl10 cyrus-sasl-devel xxhash-devel bzip2 \
 && yum clean all

# Common system tools requried to run various bash scripts
RUN yum clean all \
 && yum -y install \
    wget curl tar zip rsync openssh-server numactl-devel \
 && yum clean all
 
RUN mkdir -p /dunedaq/run && chmod go+rw /dunedaq/run


ENTRYPOINT ["/bin/bash", "-l", "-c" ]
