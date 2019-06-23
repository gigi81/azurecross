#!/bin/bash
git clone https://github.com/balena-io/qemu
cd qemu
mkdir build
cd build
../configure
make
make install
