#!/bin/bash

set -e

VOLUME_NAME="root.qcow2"
VOLUME_PATH="$(pwd)/${VOLUME_NAME}"

GDB_PORT=5523

MOUNT_DIR="$(pwd)"

if [ ! -f ${VOLUME_PATH} ]; then
    echo "Отсутствует образ виртуального диска ..."
    curl -L -o ${VOLUME_PATH} 'https://www.dropbox.com/s/ghjthg6ngh5otnb/root.qcow2?dl=1'
fi

echo "GDB сервер доступен на порту ${GDB_PORT} ..."
qemu-system-x86_64 \
    -smp 1 \
    -m 512 \
    -net user,hostfwd=tcp::${GDB_PORT}-:123 \
    -hda "${VOLUME_PATH}" \
    -drive format=raw,file=fat:rw:"${MOUNT_DIR}"
