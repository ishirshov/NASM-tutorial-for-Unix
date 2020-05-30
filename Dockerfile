FROM alpine:3.7

ENV LANG=C.UTF-8

MAINTAINER Ildar Shirshov <ildar-shirshov@ya.ru>

RUN \
# Installing dependecies
    apk add --no-cache gcc make build-base binutils linux-headers texinfo ncurses-dev ncurses-libs
RUN \
# Make gdb
    wget -qO- http://ftp.gnu.org/gnu/gdb/gdb-8.1.tar.xz | tar -xJ -C /tmp && \
    cd /tmp/gdb-8.1 && \
    ./configure --enable-tui && \
    make && \
    make install
RUN \
# Cleanup
    rm -f /var/cache/apk/*

RUN \
# Make nasm
    wget -qO- https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz | tar -xJ -C /tmp && \
    cd /tmp/nasm-2.14.02 && \
    ./configure && \
    make && \
    make install

VOLUME ["/app"]
WORKDIR /app
