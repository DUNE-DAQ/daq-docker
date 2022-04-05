# This Dockerfile is used to build an headles vnc image based on Centos

FROM scientificlinux/sl:7

ENV REFRESHED_AT 2022-04-04

# Tools for building the DAQ release

RUN yum clean all \
 && yum -y install epel-release \
 && yum -y install https://repo.ius.io/ius-release-el7.rpm \
 && yum -y update \
 && yum -y install libzstd git224 \
    make redhat-lsb-core glibc-devel \
    openssl-devel xz-devel bzip2-devel libcurl-devel \
    openssl libzstd-devel cyrus-sasl-devel xxhash xxhash-libs \
 && yum clean all

# Common system tools requried to run various bash scripts
RUN yum clean all \
 && yum -y install \
    wget curl tar zip rsync openssh-server \
 && yum clean all

# Additional system tools required by spack installation
RUN yum clean all \
 && yum -y install \
    python3 python3-devel python3-libs java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless \
    gcc gcc-c++ gcc-gfortran libgcc bzip2 bzip2-devel \
    bzip2-libs unzip librdmacm libuuid-devel \
    python36-setuptools_scm python36-pip python3-apipkg \
    python36-PyYAML \
 && yum clean all


ENTRYPOINT ["/bin/bash"]
