FROM ubuntu:20.04
LABEL maintainer="Martin Mirchev <mmirchev@comp.nus.edu.sg>"

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

# install experiment dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  \
    automake \
    autopoint \
    ca-certificates \
    python3 \
    python3-pip \
    cmake \
    curl \
    gcc \
    libpython3-dev \
    libtool \
    nasm \
    nano \
    openssl \
    pkg-config \
    psmisc \
    python3 \
    libc6-dev-i386 \
    gcc-multilib \
    g++-multilib \
    clang \
    software-properties-common \
    git \
    build-essential \
    subversion \
    perl \
    curl \
    maven \
    gradle \
    ant \
    unzip \
    cpanminus \
    make \
    flex \
    bison \
    libssl-dev \
    libelf-dev \
    bc \
    wget
    
# Java version
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Timezone
ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /

RUN mkdir /bugsinpy
COPY . /bugsinpy