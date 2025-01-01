FROM ubuntu:24.04

ARG WASI_VERSION=25
ENV WASI_VERSION=${WASI_VERSION}

ENV NAME="wasi-sdk-${WASI_VERSION}.0-x86_64-linux"
ENV URL="https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VERSION}/${NAME}.tar.gz"

RUN apt-get -yqq update && \
    apt-get -yqq install wget && \
    wget -qc "${URL}" && \
    tar zxf "${NAME}.tar.gz" && \
    rm -f "${NAME}.tar.gz" && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]