FROM base_gcc as mcc_daq
WORKDIR /root
# ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN git clone https://github.com/signal11/hidapi.git
WORKDIR /root/hidapi
# RUN ls
# WORKDIR /root

