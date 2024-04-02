FROM ubuntu:20.04
LABEL maintainer="Martin Mirchev <mmirchev@comp.nus.edu.sg>"

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

# install experiment dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  \
    ca-certificates \
    python3 \
    python3-pip \
    python3-venv \
    python3-wheel \
    python3-dev \
    libpython3-dev \
    nano \
    openssl \
    gcc \
    g++ \
    build-essential \
    autoconf \
    libtool \
    pkg-config \
    psmisc \
    python3 \
    git \
    curl \
    unzip \
    make \
    libssl-dev \
    dos2unix \
    libelf-dev \
    bc \
    wget
    

RUN pip3 install wheel
RUN pip install wheel

# Timezone
ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /

RUN mkdir /bugsinpy
COPY . /bugsinpy