# This docker file is to add cvmfs mirror of external dependencies used by the DUNE DAQ development release

FROM dunedaq/c8-minimal:spack

MAINTAINER Pengfei Ding "dingpf@fnal.gov"
ENV REFRESHED_AT 2022-04-04

ADD sandbox/spack-externals /cvmfs/dunedaq-development.opensciencegrid.org/sandbox/spack-externals
ADD pypi-repo /cvmfs/dunedaq.opensciencegrid.org/pypi-repo


ENTRYPOINT ["/bin/bash", "-l", "-c"]
