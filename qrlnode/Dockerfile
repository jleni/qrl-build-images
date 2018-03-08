#Download base ubuntu image
FROM ubuntu:16.04
RUN apt-get update && \
    apt-get -y install ca-certificates curl && \
    apt-get -y install build-essential net-tools git sudo socat && \
    apt-get -y install swig3.0 python3-dev python3-pip build-essential cmake pkg-config && \
    apt-get -y install libssl-dev libffi-dev libhwloc-dev libboost-dev

RUN echo "ALL ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN pip3 install -U pip docker

# Save time by preinstalling
RUN pip3 install --upgrade pip cmake virtualenv setuptools PyScaffold==2.5.8 | cat
RUN pip3 install -U -r https://raw.githubusercontent.com/theQRL/QRL/master/requirements.txt

# ENV - Define environment variables
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# TODO: define any required environment variables

# COPY - Copy configuration/scripts

# VOLUME - link directories to host

# TODO: Map to host directory to keep wallets outside

# START SCRIPT
CMD ["/root/scripts/start.sh"]

# EXPOSE PORTS
# TODO: Map ports to get access from outside
