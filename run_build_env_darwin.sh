#!/bin/bash

KERNEL_VOLUME_NAME="$(pwd)/src"
KERNEL_IMAGE_NAME=nasm_x86_env_linux

docker build . --rm --tag ${KERNEL_IMAGE_NAME} --file Dockerfile
docker run -v ${KERNEL_VOLUME_NAME}:/app --cap-add=SYS_ADMIN --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --tty --interactive --rm ${KERNEL_IMAGE_NAME} /bin/sh
