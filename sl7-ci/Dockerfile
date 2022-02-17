# This docker file is to add cvmfs mirror of external dependencies used by the DUNE DAQ development release

FROM dunedaq/sl7-minimal:latest

MAINTAINER Pengfei Ding "dingpf@fnal.gov"
ENV REFRESHED_AT 2021-03-18

ADD image-sl7/cvmfs/dunedaq-development.opensciencegrid.org /cvmfs/dunedaq-development.opensciencegrid.org
ADD image-sl7/cvmfs/dunedaq.opensciencegrid.org/setup_dunedaq.sh /cvmfs/dunedaq.opensciencegrid.org/setup_dunedaq.sh
ADD image-sl7/cvmfs/dunedaq.opensciencegrid.org/tools /cvmfs/dunedaq.opensciencegrid.org/tools
ADD image-sl7/cvmfs/dunedaq.opensciencegrid.org/products /cvmfs/dunedaq.opensciencegrid.org/products
ADD image-sl7/cvmfs/dunedaq.opensciencegrid.org/pypi-repo /cvmfs/dunedaq.opensciencegrid.org/pypi-repo

ENTRYPOINT ["/bin/bash", "-l", "-c" ]
