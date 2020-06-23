#!/bin/sh

SRC_DIR="$(pwd)/src"
BOOT_DIR="$(pwd)/boot"
GDB_PORT=5523

echo "GDB сервер доступен на порту ${GDB_PORT} ..."

qemu-system-i386 \
	-M pc \
	-kernel ${BOOT_DIR}/bzImage \
    -net user,hostfwd=tcp::${GDB_PORT}-:123 \
	-virtfs local,path=${SRC_DIR},mount_tag=host0,security_model=none,id=host0 \
	-drive file=${BOOT_DIR}/rootfs.ext2,if=virtio,format=raw \
	-append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
	-net nic,model=virtio \
	-net user \
    -nographic
