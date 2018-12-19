FROM base_gcc as mcc_daq
WORKDIR /root
# ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    unzip \
    pkg-config \
    udev \
    libtool \
    libudev-dev \
    libusb-1.0 \
    libhidapi-libusb0 \
    && \
    apt-get clean


ADD https://github.com/signal11/hidapi/archive/master.zip hidapi.zip
ADD https://github.com/wjasper/Linux_Drivers/archive/master.zip mcc_drivers.zip
RUN unzip -q hidapi.zip
RUN unzip -q mcc_drivers.zip -d mcc
WORKDIR /root/hidapi-master
RUN ./bootstrap
RUN ./configure
RUN make -j4
RUN make install


WORKDIR /root/mcc/Linux_Drivers-master
# set up the udev rules  -jk don't need to do this in container
# RUN mkdir -p /etc/udev/rules.d
# RUN cp 61-mcc.rules /etc/udev/rules.d/
# RUN /sbin/udevadm control --reload
WORKDIR USB/mcc-libusb
# making just the 2408 test because that is the only thing I need. 
RUN make -j4 test-usb2408
RUN make install
# RUN ls
# WORKDIR /root

