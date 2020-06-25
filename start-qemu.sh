#!/bin/bash

SRC_DIR="$(pwd)/src"
BOOT_DIR="$(pwd)/boot"
GDB_PORT=5523

if [[ "${OSTYPE}" == "darwin"*  ]]; then
    VIRTFS_OPTION="-drive format=raw,file=fat:rw:${SRC_DIR}"
elif [[ "${OSTYPE}" == "linux-gnu"* ]]; then
    VIRTFS_OPTION="-virtfs local,path=${SRC_DIR},mount_tag=host0,security_model=none,id=host0"
else
    echo "Ошибка! Платформа ${OSTYPE} не поддерживается ..." >&2
    exit -1
fi

echo "GDB сервер доступен на порту ${GDB_PORT} ..."

qemu-system-i386 \
	-M pc \
	-kernel ${BOOT_DIR}/bzImage \
    -net user,hostfwd=tcp::${GDB_PORT}-:123 \
    ${VIRTFS_OPTION} \
	-drive file=${BOOT_DIR}/rootfs.ext2,if=virtio,format=raw \
	-append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
	-net nic,model=virtio \
	-net user \
    -nographic
