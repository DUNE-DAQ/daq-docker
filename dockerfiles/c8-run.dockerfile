# This Dockerfile is used to build an headles vnc image based on Centos

#FROM centos:centos8
FROM ghcr.io/dune-daq/c8-minimal:latest

ENV REFRESHED_AT 2021-11-18

ENV UPS_OVERRIDE="-H Linux64bit+4.18-2.28"

# Common system tools requried to for debugging and causing trouble
RUN yum clean all \
 && yum -y install \
    sudo pciutils iputils iproute telnet nc \
 && yum clean all
 
ENTRYPOINT ["/bin/bash"]
