# This Dockerfile is used to build an headles vnc image based on Centos

FROM centos:centos8

ENV REFRESHED_AT 2021-11-18

ENV UPS_OVERRIDE="-H Linux64bit+4.18-2.28"

# Tools for building the DAQ release

RUN yum clean all \
 && yum -y install epel-release \
 && yum -y update \
 && yum -y install libzstd git \
    make redhat-lsb-core glibc-devel \
    openssl-devel xz-devel bzip2-devel libcurl-devel libunwind-devel \
    openssl libzstd-devel cyrus-sasl-devel xxhash xxhash-libs \
 && yum clean all

# Common system tools requried to run various bash scripts
RUN yum clean all \
 && yum -y install \
    wget curl tar zip rsync openssh-server \
 && yum clean all


ENTRYPOINT ["/bin/bash"]
