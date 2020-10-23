#!/bin/sh

# 1
fdisk -l
fdisk /dev/sda
# p
# default
# default
# +300M
# p
# w

# 2
blkid | egrep "sda3" | egrep -o "PARTUUID=\".+\"" > $HOME/partUUID
# 3
mkfs.ext4 -b 4096 /dev/sda3
# 4
dumpe2fs -h /dev/sda3
# 5
tune2fs -c 2 -i 2m /dev/sda3
# 6
mkdir /mnt/newdisk
mount /dev/sda3 /mnt/newdisk/
# 7
ln -s /mnt/newdisk/ $HOME/newdisk
# 8
mkdir $HOME/newdisk/testDir
# 9
echo UUID=$(blkid | egrep "sda3" | egrep -o "\"[A-Za-z0-9\-]+\"" | head -1 | egrep -o "[A-Za-z0-9\-]+") /mnt/newdisk ext4 noexec,nodiratime,rw 0 2 >> /etc/fstab
reboot
# 10
fdisk /dev/sda
# удаляем, создаем на +350М, затем расширяем файловую систему с resize2fs. проверяем fdisk -l
# 11
fsck -n /dev/sda3
# 12
fdisk /dev/sda
mkfs.ext4 -b 4096 /dev/sda4
tune2fs location=/dev/sda4 /dev/sda3
# 13
fdisk /dev/sdb
# 14
vgcreate LVM /dev/sdb1 /dev/sdb2
lvcreate -l 100%FREE -n LVM LVM
mkdir /mnt/supernewdisk
mkfs.ext4 /dev/LVM/LVM
mount /dev/LVM/LVM /mnt/supernewdisk
# 15
mkdir /mnt/share
mount.cifs //192.168.1.222/Users/bmb/Documents/5sem/linux/shared /mnt/share
# 16
echo //192.168.1.222/Users/bmb/Documents/5sem/linux/shared /mnt/share cifs auto 0 0 >> /etc/fstab
