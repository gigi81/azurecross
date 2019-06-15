export TC_FILE=gcc-arm-$TC_VERSION-x86_64-$TC_TRIPLE.tar.xz
export SYS_FILE=sysroot-glibc-$TC_VERSION-x86_64-$TC_TRIPLE.tar.xz

#https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
echo "Downloading toolchain $TC_FILE"
wget -nv https://developer.arm.com/-/media/Files/downloads/gnu-a/$TC_VERSION/binrel/$TC_FILE
wget -nv https://developer.arm.com/-/media/Files/downloads/gnu-a/$TC_VERSION/binrel/$TC_FILE.asc
md5sum --check $TC_FILE.asc

echo "Downloading sysroot $SYS_FILE"
wget -nv https://developer.arm.com/-/media/Files/downloads/gnu-a/$TC_VERSION/binrel/sysroot/$SYS_FILE
#asc file is not correct, skipping check
#wget -nv https://developer.arm.com/-/media/Files/downloads/gnu-a/$TC_VERSION/binrel/sysroot/$SYS_FILE.asc
#md5sum --check $SYS_FILE.asc

echo "Installing toolchain into $TC_ROOT"
mkdir $TC_ROOT
tar -xJf $TC_FILE -C $TC_ROOT --strip 1

echo "Installing sysroot into $TC_ROOT/sysroot"
mkdir $TC_ROOT/sysroot
tar -xJf $SYS_FILE -C $TC_ROOT/sysroot

rm $TC_FILE
rm $TC_FILE.asc
rm $SYS_FILE
rm $SYS_FILE.asc
