#!/bin/bash

#1
yum groupinstall "Development tools"

#2
tar -zxvf bastet-0.43
mv bastet-0.43 bastet
yum update
yum install epel-release boost boost-thread boost-devel ncurses-devel ncurses
cd bastet
make
./bastet
echo "install:[\n TAB] cp ~/lab4/bastet/bastet /usr/bin [\n TAB] chmod 775 /usr/bin/bastet" > Makefile

#3
yum list installed > ~/lab4/task3.log

#4
yum deplist gcc | egrep "*dependency*" > ~/lab4/task4_1.log
yum provides "*libgcc*" > ~/lab4/task4_2.log

#5
mkdir /root/localrepo
cp /mnt/share/checkinstall-1.6.2-3.el6.1.x86_64.rpm /root/localrepo
yum install createrepo
createrepo ~/localrepo
cd /etc/yum.repos.d
nano local.repo
"[Local]"
"name=localrepo"
"baseurl=file:/root/localrepo/"
"enabled=1"
"gpgcheck=0"

#6
yum repolist > ~/lab4/task6.log

#7 (yum.repos.d)
yum repolist
yum list available
yum install checkinstall.x86_64

#8
yum install alien
alien --to-rpm ~/fortunes-ru_1.52-2_all.deb
rpm -i --force ~/*.rpm

#9
yum install wget
yum install file-devel
yum install groff
yum install texinfo

wget http://vault.centos.org/8.1.1911/BaseOS/Source/SPackages/nano-2.9.8-1.el8.src.rpm
rpm2cpio nano-2.9.8-1.el8.src.rpm | cpio -dimv
#edit nano.spec
echo "alias newnano=nano" >> /etc/bashrc

cp nano-2.9.8.tar.gz ~/rpmbuild/SOURCES
cp nanorc ~/rpmbuild/SOURCES
rpmbuild -bb nano.spec
dnf reinstall ~/rpmbuild/RPMS/x86_64/nano-2.9.8-1.el8.x86_64.rpm

# python и запустить тетрис + последеий пункт
