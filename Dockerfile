FROM ubuntu:23.10

ARG WASI_VERSION=22
ENV WASI_VERSION=${WASI_VERSION}

RUN apt-get -yqq update && \
    apt-get -yqq install wget && \
    wget -qc https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VERSION}/wasi-sdk-${WASI_VERSION}.0-linux.tar.gz && \
    tar zxf wasi-sdk-${WASI_VERSION}.0-linux.tar.gz && \
    rm -f wasi-sdk-${WASI_VERSION}.0-linux.tar.gz && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]