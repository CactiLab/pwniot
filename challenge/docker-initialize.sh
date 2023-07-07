#!/bin/bash

# send stdout/stderr to logfile
exec >logfile.txt 2>&1

# # Add entry to /etc/fstab
# echo 'binfmt_misc /proc/sys/fs/binfmt_misc binfmt_misc non 0 0' >> /etc/fstab

# # Remount all filesystems
# sudo mount -a

echo "whoami"
whoami

# # Enable binfmt_misc https://access.redhat.com/solutions/1985633
# sudo mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
echo "mounting"
# sudo mount -t binfmt_misc binfmt_misc /proc/sys/fs/binfmt_misc
sudo mount -t binfmt_misc none /proc/sys/fs/binfmt_misc
# echo 1 > /proc/sys/fs/binfmt_misc/status
echo "modprbe"
sudo modprobe binfmt_misc

echo "update-binfmts"
sudo update-binfmts --enable qemu-aarch64
sudo update-binfmts --enable qemu-arm

# echo "cp"
# sudo cp /usr/bin/qemu-aarch64-static /usr/bin/qemu-aarch64
# sudo cp /usr/bin/qemu-arm-static /usr/bin/qemu-aarch64

# echo "tee"
# echo ':qemu-aarch64:m::\x7felf\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/bin/qemu-aarch64:' > /proc/sys/fs/binfmt_misc/register
echo "echo"
sudo touch /proc/sys/fs/binfmt_misc/register
sudo echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:' > /proc/sys/fs/binfmt_misc/register
# cat /proc/sys/fs/binfmt_misc/qemu-aarch64


