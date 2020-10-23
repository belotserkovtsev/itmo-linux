#!/bin/sh
# яндекс диск подмонтировать в виртуалку

yum install epel-release
yum install davfs2
mkdir /mnt/yadisk
mount -t davfs https://webdav.yandex.ru /mnt/yadisk
