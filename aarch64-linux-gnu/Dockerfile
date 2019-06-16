ARG TC_VERSION
FROM gigi81/azurecross:base
MAINTAINER Luigi Grilli "luigi.grilli@gmail.com"

ENV TC_VERSION=$TC_VERSION
ENV TC_PROCESSOR "aarch64"
ENV TC_TRIPLE aarch64-linux-gnu
ENV TC_ROOT=/toolchain
ENV CMAKE_TOOLCHAIN_FILE=/azp/toolchain.cmake

ENV AS=${TC_ROOT}/bin/${TC_TRIPLE}-as \
    AR=${TC_ROOT}/bin/${TC_TRIPLE}-ar \
    CC=${TC_ROOT}/bin/${TC_TRIPLE}-gcc \
    CPP=${TC_ROOT}/bin/${TC_TRIPLE}-cpp \
    CXX=${TC_ROOT}/bin/${TC_TRIPLE}-g++ \
    LD=${TC_ROOT}/bin/${TC_TRIPLE}-ld \
    FC=${TC_ROOT}/bin/${TC_TRIPLE}-gfortran

ENV QEMU_LD_PREFIX "${TC_ROOT}/sysroot"
ENV QEMU_SET_ENV "LD_LIBRARY_PATH=${TC_ROOT}/lib:${QEMU_LD_PREFIX}"

WORKDIR /azp

RUN export && ./toolchain.sh

CMD ["./start.sh"]
