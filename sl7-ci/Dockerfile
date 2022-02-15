# This docker file is to add cvmfs mirror of external dependencies used by the DUNE DAQ development release

FROM dunedaq/sl7-minimal:latest

MAINTAINER Pengfei Ding "dingpf@fnal.gov"
ENV REFRESHED_AT 2021-03-18

ADD image-sl7/cvmfs/dunedaq.opensciencegrid.org /cvmfs/dunedaq.opensciencegrid.org
ADD image-sl7/cvmfs/dunedaq-development.opensciencegrid.org /cvmfs/dunedaq-development.opensciencegrid.org

ENTRYPOINT ["/bin/bash", "-l", "-c" ]
