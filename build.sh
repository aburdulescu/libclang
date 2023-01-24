#!/bin/sh

set -xe

version=15.0.0

rm -rf \
   libclang-build \
   libclang

if [ ! -d llvm-project-$version.src ]
then
    wget https://github.com/llvm/llvm-project/releases/download/llvmorg-$version/llvm-project-$version.src.tar.xz
    tar xf llvm-project-$version.src.tar.xz
fi

export CC=clang
export CXX=clang++

cmake \
    -S llvm-project-$version.src/llvm \
    -B libclang-build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=$PWD/libclang \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_ENABLE_PROJECTS="clang" \
    -DLLVM_TARGETS_TO_BUILD="" \
    -DBUILD_SHARED_LIBS=OFF \
    -DLLVM_ENABLE_TERMINFO=OFF \
    -DLLVM_ENABLE_ZLIB=OFF

ninja -C libclang-build install-libclang install-libclang-headers
