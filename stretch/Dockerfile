#Download base ubuntu image
FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    apt-get -y install ca-certificates curl && \
    apt-get -y install build-essential pkg-config git sudo wget

# Prepare python
RUN apt-get -y install swig3.0 python3 python3-dev python3-pip libhwloc-dev libboost-dev

RUN pip3 install --upgrade pip cmake virtualenv setuptools PyScaffold
RUN pip3 install -U -r https://raw.githubusercontent.com/theQRL/QRL/master/requirements.txt
RUN pip3 install -U -r https://raw.githubusercontent.com/theQRL/QRL/master/test-requirements.txt

RUN echo "ALL ALL=NOPASSWD: ALL" >> /etc/sudoers

# ENV - Define environment variables
# TODO: define any required environment variables

# COPY - Copy configuration/scripts
COPY build.sh /build.sh

# VOLUME - link directories to host

# START SCRIPT - The script is started from travis with the appropriate environment variables

# EXPOSE PORTS
# TODO: Map ports to get access from outside
