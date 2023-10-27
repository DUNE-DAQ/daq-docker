# This Dockerfile is used to build an headles vnc image based on Centos

#FROM centos:centos8
FROM ghcr.io/dune-daq/alma9-minimal:latest

ENV REFRESHED_AT 2023-10-04

# Common system tools requried to for debugging and causing trouble
RUN yum clean all \
 && yum -y install \
    sudo pciutils iputils iproute telnet nc \
 && yum clean all
 
ENTRYPOINT ["/bin/bash"]
