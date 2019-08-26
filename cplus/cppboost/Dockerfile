# fetch basic image
FROM ubuntu:18.04 as build

RUN apt-get update \
      && apt-get -y upgrade \
      && apt-get install -y \
        software-properties-common \
        wget \
      && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
      && apt-get install -y \
        make \
        curl \
        git \
      && apt-get install -y cmake

RUN apt-get install -y \
        gcc-9 g++-9 gcc-9-base \
      && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100 \
      && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100

RUN mkdir -p /usr/local/src \
      && cd /usr/local/src \
      && wget https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.gz \
      && tar -zxvf boost_1_71_0.tar.gz \
      && cd boost_1_71_0/ \
      && ./bootstrap.sh \
      && ./b2 install
