#!/bin/bash
# exit when any command fails
set -e

git clone https://github.com/balena-io/qemu
cd qemu
mkdir build
cd build
../configure --target-list=arm-linux-user,aarch64-linux-user,armeb-linux-user,aarch64_be-linux-user,arm-softmmu,aarch64-softmmu --prefix=/usr

make -j8
make install
cd ../..
rm -rf qemu
