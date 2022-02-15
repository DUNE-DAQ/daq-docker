# This docker file is to add cvmfs mirror of external dependencies used by the DUNE DAQ development release

FROM dunedaq/c8-minimal:latest

MAINTAINER Pengfei Ding "dingpf@fnal.gov"
ENV REFRESHED_AT 2022-02-04

ADD image-cs8/cvmfs/dunedaq.opensciencegrid.org /cvmfs/dunedaq.opensciencegrid.org
ADD image-cs8/cvmfs/dunedaq-development.opensciencegrid.org /cvmfs/dunedaq-development.opensciencegrid.org

ENTRYPOINT ["/bin/bash", "-l", "-c"]
