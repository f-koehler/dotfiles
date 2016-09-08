#!/bin/bash

mkdir -p build
cd build

uname -r | grep ARCH
RETVAL=$?

if [ "$RETVAL" -eq 0 ]; then
    cmake -DCMAKE_BUILD_TYPE=Release -DDOWNLOAD_CLANG=OFF -DLLVM_CONFIG=/usr/bin/llvm-config ..
else
    cmake ..
fi
make -j$(nproc)
make install
make clean
