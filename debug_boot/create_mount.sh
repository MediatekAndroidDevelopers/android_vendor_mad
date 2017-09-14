#!/bin/bash
echo "#!/sbin/busybox sh" > $1/mount_fs
echo "" >> mount_fs
echo "BB=/sbin/busybox" >> $1/mount_fs
echo "SYSTEMBLOCK=/dev/block/mmcblk0p$2" >> $1/mount_fs
echo "" >> $1/mount_fs
echo "\$BB mknod \$SYSTEMBLOCK b 179 $2" >> $1/mount_fs
echo "" >> $1/mount_fs
echo "\$BB mount -t ext4 -o rw,relatime \$SYSTEMBLOCK /system" >> $1/mount_fs
