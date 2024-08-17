FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

RUN apt update

RUN apt-get install -y gcc git groff libncurses5-dev libncursesw5-dev make

RUN git clone https://github.com/cisco/ChezScheme.git --filter=blob:none

WORKDIR /workspace/ChezScheme

RUN ./configure \
    && make \
    && make install

WORKDIR /code

COPY bin .

# 
# CMD "./run.sh"