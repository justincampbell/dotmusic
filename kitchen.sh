#!/bin/bash -ex

apt-get install -y git-core make

wget -O bats.tar.gz https://github.com/sstephenson/bats/archive/v0.3.1.tar.gz && \
  tar -zxvf bats.tar.gz && \
  cd bats* && \
  ./install.sh /usr

cd /tmp/kitchen/data
make
