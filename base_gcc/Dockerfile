## Builds a base image with all the necessary build tools

FROM ubuntu:16.04 as base_gcc
WORKDIR /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install -y \
    curl \
    dirmngr \
    gnupg2 \
    lsb-release \
    build-essential