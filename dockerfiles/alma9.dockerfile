FROM almalinux:9

ENV REFRESHED_AT 2023-02-27


# Tools for building the DAQ release

RUN yum clean all \
 && yum -y install epel-release dnf-plugins-core \
 && yum -y upgrade \
 && dnf config-manager --set-enabled crb \
 && yum clean all

# Tools for building the DAQ release
RUN yum -y install git make glibc-devel \
    openssl-devel xz-devel bzip2-devel libcurl-devel libunwind-devel \
    openssl  compat-openssl11 cyrus-sasl-devel xxhash-libs xxhash bzip2 \
 && yum clean all

# Common system tools requried to run various bash scripts
RUN yum clean all \
 && yum -y install \
    wget tar zip rsync openssh-server numactl-devel \
 && yum clean all

RUN yum clean all \
 && yum -y install python3 python3-devel python3-libs java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless gcc gcc-c++ \
    gcc-gfortran libgcc bzip2 bzip2-devel bzip2-libs unzip librdmacm \
    libuuid-devel python3-setuptools python3-setuptools_scm python3-pip \
    python3-apipkg python3-pyyaml \
 && yum clean all

RUN mkdir -p /dunedaq/run && chmod go+rw /dunedaq/run

RUN yum clean all \
 && yum -y install https://repo.opensciencegrid.org/osg/3.6/osg-3.6-el9-release-latest.rpm \
 && yum -y update \
 && yum clean all

# This is not available yet for EL9.
# RUN yum clean all \
# && yum --enablerepo=epel -y install osg-wn-client \
# && yum clean all


## DPF 2023-02-27: The rest of the file needs some clean-up. 

RUN yum clean all \
 && yum -y install \
 asciidoc autoconf automake bzip2-devel expect freetype-devel \
 gcc gcc-c++ gdbm-devel gettext glibc-devel gstreamer1 \
 gstreamer1-plugins-base-devel gtk2-devel libX11-devel libXext-devel \
 libXft-devel libXi-devel libXmu-devel libXpm-devel libXrender-devel \
 libXt-devel libconfuse-devel libcurl-devel libffi-devel libgcc \
 libjpeg-turbo-devel libpng-devel libstdc++ libstdc++-devel libtool \
 libuuid-devel mesa-libGL-devel mesa-libGLU-devel ncurses-devel \
 nss_wrapper openldap-devel openssl-devel perl perl-DBD-SQLite \
 perl-ExtUtils-MakeMaker readline-devel swig tcl-devel tk-devel \
 libunwind-devel \
 xmlto xterm xxhash-libs xxhash xz-devel zlib-devel  compat-openssl11 openssl \
 && yum clean all

RUN yum clean all \
 && yum -y install \
 bzip2 dbus-x11 gdb git htop net-tools nmap-ncat openssh-clients \
 openssh-server patch rsync strace subversion sudo \
 time tmux vim-enhanced which xorg-x11-fonts* \
 && yum clean all

RUN yum clean all \
 && yum -y install glew-devel texinfo \
 && yum clean all

RUN yum clean all \
 && yum -y install java-11-openjdk \
 && yum clean all

RUN yum clean all \
 && yum -y install \
 glibc-devel.i686 libstdc++.i686 libgcc.i686 \
 numactl-devel \
 && yum clean all

RUN yum clean all \
 && yum -y install \
    texinfo patch \
 && yum clean all

RUN dbus-uuidgen > /var/lib/dbus/machine-id

ENTRYPOINT ["/bin/bash", "-l", "-c" ]
