FROM quay.io/centos/centos:stream8

MAINTAINER Pengfei Ding "dingpf@fnal.gov"
ENV REFRESHED_AT 2022-04-04

RUN yum clean all \
 && yum -y install epel-release \
 && yum -y install https://repo.opensciencegrid.org/osg/3.5/osg-3.5-el8-release-latest.rpm \
 && yum -y update \
 && yum clean all

RUN yum clean all \
 && yum --enablerepo=epel,powertools -y install osg-wn-client \
 && yum clean all

RUN yum clean all \
 && yum --enablerepo=powertools -y install \
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
 xmlto xterm xxhash-devel xz-devel zlib-devel  compat-openssl10 openssl \
 && yum clean all

RUN yum clean all \
 && yum -y install \
 bzip2 dbus-x11 gdb git htop net-tools nmap-ncat openssh-clients \
 openssh-server patch redhat-lsb-core rsync strace subversion sudo \
 time tmux vim-enhanced which xorg-x11-fonts* \
 && yum clean all

RUN yum clean all \
 && yum --enablerepo=powertools -y install glew-devel texinfo \
 && yum clean all

RUN yum clean all \
 && yum -y install java-11-openjdk \
 && yum clean all

RUN yum clean all \
 && yum -y install \
 glibc-devel.i686 libstdc++.i686 libgcc.i686 compat-openssl10 \
 numactl-devel libbsd-devel \
 && yum clean all

ENV UPS_OVERRIDE="-H Linux64bit+4.18-2.28"

RUN dbus-uuidgen > /var/lib/dbus/machine-id

ENTRYPOINT ["/bin/bash", "-l", "-c" ]
