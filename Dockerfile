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
    zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev \
    libgdbm-dev libnss3-dev libedit-dev libc6-dev \
    git \
    curl \
    unzip \
    make \
    libssl-dev \
    dos2unix \
    libelf-dev \
    bc 

WORKDIR /opt
RUN git clone --depth=1 https://github.com/pyenv/pyenv.git pyenv
ENV PYENV_ROOT=/opt/pyenv
RUN git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"


RUN pip3 install wheel
RUN pip install wheel

RUN ln -sf /usr/local/bin/pip3 /usr/bin/pip3
RUN ln -sf /usr/local/bin/pip /usr/bin/pip

# Timezone
ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /

RUN mkdir /bugsinpy
COPY . /bugsinpy