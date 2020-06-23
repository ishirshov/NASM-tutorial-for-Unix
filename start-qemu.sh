#!/bin/sh

SRC_DIR="$(pwd)/src"
BOOT_DIR="$(pwd)/boot"

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS='-serial stdio'
fi

qemu-system-i386 \
	-M pc \
	-kernel ${BOOT_DIR}/bzImage \
	-virtfs local,path=${SRC_DIR},mount_tag=host0,security_model=none,id=host0 \
	-drive file=${BOOT_DIR}/rootfs.ext2,if=virtio,format=raw \
	-append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
	-net nic,model=virtio \
	-net user  ${EXTRA_ARGS}
