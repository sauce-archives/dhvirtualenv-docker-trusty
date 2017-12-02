FROM ubuntu:trusty

# apt dependencies (including python and dh-virtualenv)
# TODO:: do we really need apt-transport-https?        apt-transport-https \
RUN apt-get update && apt-get install -y --no-install-recommends \
        tcl \
        tk \
        curl \
        git \
        ca-certificates \
        openssh-client \
        software-properties-common \
        python-software-properties \
        libvirt-dev \
        libxslt-dev \
        libxml2-dev \
        libffi-dev  \
        libssl-dev  \
        python-dev \
        pkg-config \
        debhelper && \
        add-apt-repository ppa:spotify-jyrki/dh-virtualenv && \
        apt-get -q update &&\
        apt-get -q install -y dh-virtualenv \
        python && \
        rm -rf /var/lib/apt/lists/*

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 9.0.1
RUN curl -O https://bootstrap.pypa.io/get-pip.py;\
    python get-pip.py "pip==$PYTHON_PIP_VERSION"

RUN pip install --no-cache-dir \
    virtualenv \
    jinja2