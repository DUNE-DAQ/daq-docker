#!/bin/bash

nightly_tag=$1
daq_release_branch="develop"
daq_buildtools_branch="develop"
release="dunedaq-develop"
package_checkout_branch="develop" # dunedaq-v2.4.0 or develop
workdir=/scratch
outdir="$workdir/image-cs8"
outdir_cvmfs="$workdir/image-cs8/cvmfs/dunedaq.opensciencegrid.org"
outdir_cvmfsdev="$workdir/image-cs8/cvmfs/dunedaq-development.opensciencegrid.org"

rm -rf $outdir

create_products_area () {
  target_products_dir=$1
  mkdir -p $target_products_dir
  pushd $target_products_dir
  ln -s /cvmfs/dunedaq.opensciencegrid.org/products/ups .
  cp -pr /cvmfs/dunedaq.opensciencegrid.org/products/.upsfiles .
  cp -pr /cvmfs/dunedaq.opensciencegrid.org/products/.updfiles .
  echo "s_setenv UPS_THIS_DB $SETUPS_DIR" > setups_layout
  echo "s_setenv PROD_DIR_PREFIX $SETUPS_DIR" >> setups_layout
  ln -s ups/v6_0_8/Linux64bit+3.10-2.17/ups/setups .
  ln -s ups/v6_0_8/Linux64bit+3.10-2.17/ups/setup .
  popd
}


source $workdir/daq-buildtools/env.sh
export PATH=$workdir/daq-release/scripts:$PATH
pushd $workdir/dev
dbt-workarea-env -s externals || true
setup clang v7_0_0rc3
popd


create_products_area $outdir_cvmfs/products
rm -rf $outdir_cvmfs/products/ups
cp -pr /cvmfs/dunedaq.opensciencegrid.org/products/ups $outdir_cvmfs/products
create_products_area $outdir_cvmfsdev/products


ups active|tail -n +2 | awk '{ printf "\"%s %s %s\"\n", $1, $2, $NF}'|while read i; do
    i=$(echo $i|tr '"' ' ')
    prd=$(echo $i|cut -d ' ' -f 1)
    prd_ver=$(echo $i|cut -d ' ' -f 2)
    products_dir=$(echo $i|cut -d ' ' -f 3)
    out_cvmfs=$outdir/${products_dir#/}

    exclude_list="xclang"
    #exclude_list="gcc boost clang hdf5 ups"
    if [[ $exclude_list =~ (^|[[:space:]])"$prd"($|[[:space:]]) ]]; then
	echo "for $prd, outcvmfs is $out_cvmfs"
        continue
    fi
    srcs=($products_dir/$prd/$prd_ver
	    $products_dir/$prd/${prd_ver}.version
	    $products_dir/$prd/current.chain
    )
    link_dests=($outdir_release/externals/$prd/$prd_ver
	    $outdir_release/externals/$prd/${prd_ver}.version
	    $outdir_release/externals/$prd/current.chain
    )
    cvmfs_dests=($out_cvmfs/$prd/$prd_ver
	    $out_cvmfs/$prd/${prd_ver}.version
	    $out_cvmfs/$prd/current.chain
    )
    if [ -d ${srcs[0]} ]; then
	if [ -d ${cvmfs_dests[0]} ]; then
		echo "Info: ${cvmfs_dests[0]} exists, skip."
	else
		[[ -d `dirname ${cvmfs_dests[0]}` ]] && rm -rf `dirname ${cvmfs_dests[0]}`/*
		[[ -d `dirname ${link_dests[0]}` ]] && rm -rf `dirname ${link_dests[0]}`/*
		mkdir -p `dirname ${link_dests[0]}`
		for k in `seq 0 2`; do
                    if [ -d ${srcs[k]} ]; then
			echo "found ${srcs[k]}"
			rsync -ah --exclude '*e19*debug*' --exclude 'Linux64bit+3.10*' --exclude 'slf7.x86_64*' ${srcs[k]} `dirname  ${cvmfs_dests[0]}`
                        ln -s ${srcs[k]} ${link_dests[k]}
		    fi
                done
	fi
    fi
done 


# add gcc v9_3_0

rsync -ah --exclude '*e19*debug*' --exclude 'Linux64bit+3.10*' --exclude 'slf7.x86_64*' /cvmfs/dunedaq.opensciencegrid.org/products/gcc/v9_3_0 $outdir_cvmfs/products/gcc
rsync -ah /cvmfs/dunedaq.opensciencegrid.org/products/gcc/v9_3_0.version $outdir_cvmfs/products/gcc

pushd $outdir_release/externals/gcc
ln -s /cvmfs/dunedaq.opensciencegrid.org/products/gcc/v9_3_0 .
ln -s /cvmfs/dunedaq.opensciencegrid.org/products/gcc/v9_3_0.version .
popd

rsync -ah /cvmfs/dunedaq.opensciencegrid.org/pypi-repo $outdir_cvmfs
rsync -ah /cvmfs/dunedaq.opensciencegrid.org/setup_dunedaq.sh $outdir_cvmfs
rsync -ah /cvmfs/dunedaq.opensciencegrid.org/tools $outdir_cvmfs

rm -rf /scratch/daq-release
rm -rf /scratch/daq-buildtools
rm -rf /scratch/dev

