# This docker file is to add cvmfs mirror of external dependencies used by the DUNE DAQ development release

FROM dunedaq/sl7-minimal:spack

MAINTAINER Pengfei Ding "dingpf@fnal.gov"
ENV REFRESHED_AT 2022-04-10

ADD spack-externals /cvmfs/dunedaq.opensciencegrid.org/spack-externals
ADD pypi-repo /cvmfs/dunedaq.opensciencegrid.org/pypi-repo
ADD tools /cvmfs/dunedaq.opensciencegrid.org/tools
ADD setup_dunedaq.sh /cvmfs/dunedaq.opensciencegrid.org/setup_dunedaq.sh


ENTRYPOINT ["/bin/bash"]
