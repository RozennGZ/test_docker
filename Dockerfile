FROM ubuntu:18.04

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
  apt-get install -y software-properties-common apt-utils curl wget && \
  add-apt-repository -y ppa:marutter/rrutter4.0 && \
  apt update && \
  apt install -y r-base r-base-core r-recommended

COPY Tsuki_0.1.0.tar.gz .

RUN R -e "install.packages('Tsuki_0.1.0.tar.gz',dependencies=TRUE, repos=NULL)"

