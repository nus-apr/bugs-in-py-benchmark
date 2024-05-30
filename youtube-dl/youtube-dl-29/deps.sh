#!/bin/bash

apt-get update
# Install experiment dependencies
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    openssl \
    build-essential \
    autoconf \
    libtool \
    pkg-config \
    psmisc \
    git \
    curl \
    unzip \
    make \
    libssl-dev \
    dos2unix \
    libelf-dev \
    bc \
    wget

cd /
git clone https://github.com/hzxin/bugs-in-py-benchmark.git 
mv bugs-in-py-benchmark bugsinpy


