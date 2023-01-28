#!/bin/sh

set -xe

llvm_version=15.0.0
llvm_dir=llvm-project-$llvm_version.src
llvm_tarball=$llvm_dir.tar.xz

rm -rf \
   libclang-build \
   libclang

if [ ! -d "$llvm_dir" ]
then
    if [ ! -e "$llvm_tarball" ]
    then
	wget https://github.com/llvm/llvm-project/releases/download/llvmorg-$llvm_version/$llvm_tarball
    fi
    tar xf $llvm_tarball
fi

export CC=gcc
export CXX=g++
export LDFLAGS="-static-libgcc -static-libstdc++"

cmake \
    -S $llvm_dir/llvm \
    -B libclang-build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=$PWD/libclang \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_ENABLE_PROJECTS="clang" \
    -DLLVM_TARGETS_TO_BUILD="" \
    -DBUILD_SHARED_LIBS=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_ENABLE_TERMINFO=OFF \
    -DLLVM_ENABLE_ZLIB=OFF

ninja -C libclang-build install-libclang install-libclang-headers
