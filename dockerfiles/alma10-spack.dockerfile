FROM almalinux:10

ENV REFRESHED_AT=2026-08-16

# Tools for building the DAQ release

RUN yum clean all \
 && yum -y install \
 epel-release dnf-plugins-core

# Tools for building the DAQ release
RUN yum clean all \
 && yum -y install \
    git make glibc-devel \
    openssl-devel bzip2-devel libunwind-devel \
    openssl xxhash-libs xxhash bzip2

# Common system tools requried to run various bash scripts
RUN yum clean all \
 && yum -y install \
    wget tar zip rsync openssh-server numactl-devel which

RUN yum clean all \
 && yum -y install \
    python3 python3-devel python3-libs java-21-openjdk \
    java-21-openjdk-devel gcc gcc-c++ \
    gcc-gfortran libgcc bzip2 bzip2-devel bzip2-libs unzip librdmacm \
    libuuid-devel python3-setuptools python3-setuptools_scm python3-pip \
    python3-pyyaml libusbx-devel texinfo patch libbsd-devel libnsl2 \
 && yum clean all

RUN mkdir -p /dunedaq/run && chmod go+rw /dunedaq/run

ENTRYPOINT ["/bin/bash"]
