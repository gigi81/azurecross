export TC_FILE=gcc-arm-$TC_VERSION-x86_64-$TC_TRIPLE.tar.xz

echo "Downloading toolchain $TC_FILE"
wget -nv https://developer.arm.com/-/media/Files/downloads/gnu-a/$TC_VERSION/binrel/$TC_FILE
wget -nv https://developer.arm.com/-/media/Files/downloads/gnu-a/$TC_VERSION/binrel/$TC_FILE.asc

md5sum --check $TC_FILE.asc

echo "Installing toolchain into $TC_ROOT"
mkdir $TC_ROOT
tar -xJf $TC_FILE -C $TC_ROOT --strip 1

rm $TC_FILE
rm $TC_FILE.asc
