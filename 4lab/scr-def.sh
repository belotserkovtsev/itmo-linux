#!/bin/bash
yum update -v
yum install -y python3

# or

yum install gcc openssl-devel bzip2-devel libffi-devel -y
curl -O https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tgz
tar -xzf Python-3.8.1.tgz
cd
./configure --enable-optimizations
make altinstall
