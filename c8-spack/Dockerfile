# This Dockerfile is used to build an headles vnc image based on Centos

#FROM centos:centos8
FROM quay.io/centos/centos:stream8

ENV REFRESHED_AT 2022-03-30

ENV UPS_OVERRIDE="-H Linux64bit+4.18-2.28"

# Tools for building the DAQ release

RUN yum clean all \
 && yum -y install epel-release \
 && yum -y update \
 && yum -y install git \
    make redhat-lsb-core glibc-devel \
    openssl-devel xz-devel bzip2-devel libcurl-devel libunwind-devel \
    openssl  compat-openssl10 cyrus-sasl-devel xxhash xxhash-libs bzip2 \
 && yum clean all

# Common system tools requried to run various bash scripts
RUN yum clean all \
 && yum -y install \
    wget curl tar zip rsync openssh-server \
 && yum clean all

RUN yum -y install dnf-plugins-core \
 && yum upgrade \
 && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
 && yum config-manager --set-enabled powertools \
 && yum clean all

RUN yum clean all \
 && yum -y install python38 python38-devel python38-libs java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless gcc gcc-c++ \
    gcc-gfortran libgcc bzip2 bzip2-devel bzip2-libs unzip librdmacm \
    libuuid-devel python38-setuptools python3-setuptools_scm python38-pip \
    python3-apipkg python38-pyyaml \
 && yum clean all

RUN mkdir -p /dunedaq/run && chmod go+rw /dunedaq/run

ENTRYPOINT ["/bin/bash"]
