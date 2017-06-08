FROM ubuntu:trusty

# dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        tcl \
        tk \
        curl \
        git \
        ca-certificates \
        software-properties-common \
        python-software-properties \
        libvirt-dev \
        libxml2-dev \
        libffi-dev  \
        libssl-dev  \
        python-dev \
        pkg-config \
        debhelper \
        && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install python -y 

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 9.0.1
RUN curl -O https://bootstrap.pypa.io/get-pip.py;\
    python get-pip.py \
            "pip==$PYTHON_PIP_VERSION" \
    ;

RUN pip install --no-cache-dir virtualenv

# Install dh-virtualenv
RUN add-apt-repository ppa:spotify-jyrki/dh-virtualenv &&\
    apt-get -q update &&\
    apt-get -q install -y dh-virtualenv
RUN pip install jinja2