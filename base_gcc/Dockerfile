## Builds a base image with all the necessary build tools

FROM ubuntu:16.04 as base_gcc
WORKDIR /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    curl \
    dirmngr \
    gnupg2 \
    lsb-release \
    build-essential \
    autoconf \
    && \
    apt-get clean
