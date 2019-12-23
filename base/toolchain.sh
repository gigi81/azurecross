#!/bin/bash
# exit when any command fails
set -e

export TC_FILE=gcc-arm-$TC_VERSION-x86_64-$TC_TRIPLE.tar.xz
export SYS_FILE=sysroot-glibc-$TC_VERSION-x86_64-$TC_TRIPLE.tar.xz

#https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
export TC_URL=https://developer.arm.com/-/media/Files/downloads/gnu-a/$TC_VERSION/binrel/$TC_FILE
echo "Downloading toolchain $TC_URL"
wget -nv $TC_URL
echo "Downloading toolchain asc $TC_URL"
wget -nv $TC_URL.asc

echo "Checking toolchain md5"
md5sum --check $TC_FILE.asc

echo "Installing toolchain into $TC_ROOT"
mkdir $TC_ROOT
tar -xJf $TC_FILE -C $TC_ROOT --strip 1

rm $TC_FILE
rm $TC_FILE.asc
