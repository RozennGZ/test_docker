FROM ubuntu:18.04

ARG R_VERSION=4.0.2

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
  apt-get install -y software-properties-common apt-utils curl dialog wget libpcre2-dev zlib1g-dev default-jre default-jdk liblzma-dev bzip2 libbz2-dev libpng-dev build-essential texlive-fonts-extra texinfo gfortran libtiff-dev libreadline-dev  libcurl4 libcurl4-openssl-dev libssl-dev libxml2-dev && \
  add-apt-repository -y ppa:marutter/rrutter4.0 && \
  apt update && \
  apt-get -y build-dep r-base && \
  curl -O https://cran.r-project.org/src/base/R-4/R-${R_VERSION}.tar.gz  && \
  tar -xzvf R-${R_VERSION}.tar.gz  && \
  cd R-${R_VERSION}  && \
  ./configure --prefix=/usr/local/bin/R/${R_VERSION} --enable-R-shlib --with-blas --with-lapack --with-readline=no --with-x=no && \
  make && \
  make install && \
  rm -r R-${R_VERSION}.tar.gz R-${R_VERSION}

RUN /usr/local/bin/R/${R_VERSION}/bin/R -e "install.packages('cowsay',dependencies=TRUE)"

ARG R_VERSION=3.6.2

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
  apt-get install -y software-properties-common apt-utils curl dialog wget libpcre2-dev zlib1g-dev default-jre default-jdk liblzma-dev bzip2 libbz2-dev libpng-dev build-essential texlive-fonts-extra texinfo gfortran libtiff-dev libreadline-dev  libcurl4 libcurl4-openssl-dev libssl-dev libxml2-dev && \
  add-apt-repository -y ppa:marutter/rrutter4.0 && \
  apt update && \
  apt-get -y build-dep r-base && \
  curl -O https://cran.r-project.org/src/base/R-3/R-${R_VERSION}.tar.gz  && \
  tar -xzvf R-${R_VERSION}.tar.gz  && \
  cd R-${R_VERSION}  && \
  ./configure --prefix=/usr/local/bin/R/${R_VERSION} --enable-R-shlib --with-blas --with-lapack --with-readline=no --with-x=no && \
  make && \
  make install && \
  rm -r R-${R_VERSION}.tar.gz R-${R_VERSION}



