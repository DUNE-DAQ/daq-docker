# This docker file is to add cvmfs mirror of external dependencies used by the DUNE DAQ development release

FROM dunedaq/c8-minimal:latest

MAINTAINER Pengfei Ding "dingpf@fnal.gov"
ENV REFRESHED_AT 2022-03-02

ADD image-cs8/cvmfs/dunedaq.opensciencegrid.org/products /cvmfs/dunedaq.opensciencegrid.org/products
ADD image-cs8/cvmfs/dunedaq.opensciencegrid.org/tools /cvmfs/dunedaq.opensciencegrid.org/tools
ADD image-cs8/cvmfs/dunedaq.opensciencegrid.org/pypi-repo /cvmfs/dunedaq.opensciencegrid.org/pypi-repo
ADD image-cs8/cvmfs/dunedaq.opensciencegrid.org/setup_dunedaq.sh /cvmfs/dunedaq.opensciencegrid.org/setup_dunedaq.sh
ADD image-cs8/cvmfs/dunedaq-development.opensciencegrid.org /cvmfs/dunedaq-development.opensciencegrid.org

ENTRYPOINT ["/bin/bash", "-l", "-c"]
