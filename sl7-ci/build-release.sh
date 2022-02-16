#!/bin/bash

daq_release_branch="develop"
daq_buildtools_branch="develop"
release="dunedaq-develop"
package_checkout_branch="develop" # dunedaq-v2.4.0 or develop
workdir=/scratch

rm -rf $workdir/daq-release
rm -rf $workdir/daq-buildtools
rm -rf $workdir/dev

cd $workdir
git clone https://github.com/DUNE-DAQ/daq-release.git -b $daq_release_branch
cd $workdir/daq-release
git pull

cd $workdir

git clone https://github.com/DUNE-DAQ/daq-buildtools.git -b $daq_buildtools_branch

source $workdir/daq-buildtools/env.sh
export PATH=$workdir/daq-release/scripts:$PATH

echo "============================"
echo "dbt-create dev now"
echo "============================"
dbt-create.sh -r $workdir/daq-release/configs $release dev

cd dev

dbt-workarea-env -s externals || true

retVal=$?
if [ $retVal -ne 0 ]; then
    echo "dbt-build.sh --install failed"
fi
exit $retVal
