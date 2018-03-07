# Dockerfile
# Düsseldorf Advanced Material Simulation Kit (DAMASK)
# (c) 2016-18 ICMEaix RWTH Aachen University
FROM centos:7
MAINTAINER Lukas Koschmieder <lukas.koschmieder@rwth-aachen.de>

### Common Dependencies

RUN yum install -y gcc gcc-c++ gcc-gfortran perl make \
&& yum install -y python numpy \
&& yum install -y bc bzip2 which \
&& yum clean all

### PETSc

WORKDIR /tmp
RUN curl \
--location http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.6.4.tar.gz \
--output petsc.tar.gz \
&& tar -xvf petsc.tar.gz \
&& rm -f petsc.tar.gz \
&& pushd petsc*/ \
&& ./configure \
--prefix=/opt/petsc \
--download-fblaslapack \
--download-fftw \
--download-hdf5 \
--download-openmpi \
--with-cc=gcc \
--with-cxx=g++ \
--with-fc=gfortran \
&& make all \
&& make install \
&& popd \
&& rm -rf /tmp/petsc*

### DAMASK

ENV PETSC_DIR /opt/petsc
ENV DAMASK_DIR /opt/damask

WORKDIR /tmp
RUN curl \\
--location https://damask.mpie.de/pub/Download/Current/DAMASK-2.0.1.tar.bz2 \
--output DAMASK.tar.bz2 \
&& tar -xjvf DAMASK.tar.bz2 \
&& rm -f DAMASK.tar.bz2 \
&& mv DAMASK $DAMASK_DIR

WORKDIR $DAMASK_DIR
RUN source ./DAMASK_env.sh \
&& make spectral \
&& make install
