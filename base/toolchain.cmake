set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR $ENV{TC_PROCESSOR})

set(cross_triple $ENV{TC_TRIPLE})
set(cross_root $ENV{TC_ROOT})

set(CMAKE_C_COMPILER $ENV{CC})
set(CMAKE_CXX_COMPILER $ENV{CXX})
set(CMAKE_Fortran_COMPILER $ENV{FC})

set(CMAKE_CXX_FLAGS "-I ${cross_root}/include/")

# Where to look for the target environment. (More paths can be added here)
set(CMAKE_FIND_ROOT_PATH ${cross_root} ${cross_root}/${cross_triple})

# Adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# Search headers and libraries in the target environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_INSTALL_PREFIX ${cross_root}/sysroot)

set(CMAKE_CROSSCOMPILING_EMULATOR /usr/bin/qemu-$ENV{TC_PROCESSOR})
