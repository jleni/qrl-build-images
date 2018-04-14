#Download base ubuntu image
FROM ubuntu:14.04
RUN apt-get update && \
    apt-get -y install software-properties-common python-software-properties && \
    apt-get -y install ca-certificates curl && \
    apt-get -y install build-essential pkg-config git sudo wget

# Prepare python
RUN apt-get -y install swig3.0 python3 python3-dev python3-pip libhwloc-dev libboost-dev

RUN pip3 install --upgrade pip cmake virtualenv setuptools PyScaffold
RUN pip3 install -U -r https://raw.githubusercontent.com/theQRL/QRL/master/requirements.txt
RUN pip3 install -U -r https://raw.githubusercontent.com/theQRL/QRL/master/test-requirements.txt

RUN echo "ALL ALL=NOPASSWD: ALL" >> /etc/sudoers
