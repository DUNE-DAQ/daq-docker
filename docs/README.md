# daq-docker
[![al9](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/al9.yaml/badge.svg)](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/al9.yaml)
[![alma9-minimal](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9-minimal.yaml/badge.svg)](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9-minimal.yaml)
[![alma9-run](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9-run.yaml/badge.svg)](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9-run.yaml)
[![alma9-spack](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9-spack.yaml/badge.svg)](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9-spack.yaml)
[![alma9](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9.yaml/badge.svg)](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/alma9.yaml)
[![c8](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/c8.yaml/badge.svg)](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/c8.yaml)
[![c8-minimal](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/c8-minimal.yaml/badge.svg)](https://github.com/DUNE-DAQ/daq-docker/actions/workflows/c8-minimal.yaml)

This repository houses Dockerfiles used to create images used for continuous integration the [DUNE DAQ](https://github.com/DUNE-DAQ) organization. New commits to the `develop` branch will trigger an automatic build of the image with the tag `latest`. The images are also built on an automatic, weekly schedule. 

The naming convention for Dockerfiles under `dockerfiles` is as follows:
- `minimal` denotes an image used to run the software stack on cvmfs
- `run` is an extension of minimal that adds some basic network tools for debugging
- `spack` includes additional externals which spack build relies on, e.g., `python3-yaml`. These images are used as the basis for the [externals images](https://github.com/dune-daq/daq-docker/pkgs/container/alma9-slim-externals) in which the [nightly builds](https://dune-daq-sw.readthedocs.io/en/latest/packages/daq-release/ci_github_action/#how-the-nightly-releases-are-made) are run.

For the Alma9 images,
- `alma9` is the image which developer can run an IDE with vim, emacs, OSG worker node utils (kerberos, voms-proxy, etc)
- `al9` is the absolute minimal set of packages required to run the DAQ (not currently in use)
