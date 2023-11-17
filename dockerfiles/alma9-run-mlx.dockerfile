# This Dockerfile is used to build an headles vnc image based on Centos

#FROM centos:centos8
FROM ghcr.io/dune-daq/alma9-minimal:latest

ENV REFRESHED_AT 2023-10-04

# Common system tools requried to for debugging and causing trouble
RUN yum clean all \
 && yum -y install \
    sudo pciutils bind-utils iputils iproute telnet nc  \
 && 

#RUN dnf config-manager --add-repo https://linux.mellanox.com/public/repo/mlnx_ofed/${VERSION}/rhel9.2/mellanox_mlnx_ofed.repo
ARG VERSION=latest
WORKDIR /etc/yum.repos.d
RUN wget https://linux.mellanox.com/public/repo/mlnx_ofed/${VERSION}/rhel9.2/mellanox_mlnx_ofed.repo \
   && yum install -y rdma-core libibverbs-utils iperf3 \
   && yum clean all
#mlnx-dpdk-tools
 
ENTRYPOINT ["/bin/bash"]
