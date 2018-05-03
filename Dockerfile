FROM alpine:latest

ENV LANG=C.UTF-8

MAINTAINER Ildar Shirshov <ildar-shirshov@ya.ru>

RUN \
# Installing dependecies
    apk add --no-cache gcc make build-base nasm binutils linux-headers texinfo ncurses-dev ncurses-libs && \
# Make gdb
    wget -qO- http://ftp.gnu.org/gnu/gdb/gdb-8.1.tar.xz | tar -xJ -C /tmp && \
    cd /tmp/gdb-8.1 && \
    ./configure --enable-tui && \
    make && \
    make install && \ 
# Cleanup
    rm -f /var/cache/apk/*

VOLUME ["/app"]
WORKDIR /app
