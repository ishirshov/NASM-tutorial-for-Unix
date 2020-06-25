#!/bin/sh

set -u
set -e

# Add root autologin
if [ !-e ${TAGET_DIR}/loginroot.sh ]; then
    echo "#!/bin/sh\nexec /bin/login root" > ${TARGET_DIR}/loginroot.sh
    chmod +x ${TARGET_DIR}/loginroot.sh
fi

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L -n -l /loginroot.sh tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
fi

# Add shared folder
echo "host0         /root   9p      trans=virtio,version=9p2000.L   0    0" >> ${TARGET_DIR}/etc/fstab
echo "/dev/sda1     /root   vfat    defaults                        0    0" >> ${TARGET_DIR}/etc/fstab
