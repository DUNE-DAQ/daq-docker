FROM almalinux:9

ENV REFRESHED_ON 20230808

RUN yum clean all \
 && yum -y install epel-release dnf-plugins-core \
 && yum -y upgrade \
 && dnf config-manager --set-enabled crb \
 && yum clean all

RUN yum -y install git python3-yaml glibc-devel \
 gcc gcc-c++ gcc-fortran libgcc \
 wget tar zip rsync patch lbzip2 texinfo file \
 && yum clean all

ENTRYPOINT ["/bin/bash"]
