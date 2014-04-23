#!/bin/bash -ex

package() {
  if which apt-get; then
    apt-get install $@ -y
  elif which yum; then
    yum install $@ -y
  fi
}

package make

wget -O bats.tar.gz https://github.com/sstephenson/bats/archive/v0.3.1.tar.gz && \
  tar -zxvf bats.tar.gz && \
  cd bats* && \
  ./install.sh /usr

cd /tmp/kitchen/data
make
