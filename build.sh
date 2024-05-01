#!/bin/sh

if [ $# -ne 1 ]
then
    echo "need version"
    exit 1
fi
version=$1

set -xe

llvm_dir=llvm-project-$version.src
llvm_tarball=$llvm_dir.tar.xz

if [ ! -d "$llvm_dir" ]
then
    if [ ! -e "$llvm_tarball" ]
    then
	wget https://github.com/llvm/llvm-project/releases/download/llvmorg-$version/$llvm_tarball
    fi
    tar xf $llvm_tarball
fi

build_dir=libclang-build-$version
install_dir=libclang-dist-$version

rm -rf $build_dir $install_dir

export CC=gcc
export CXX=g++
export LDFLAGS="-static-libgcc -static-libstdc++"

cmake \
    -S $llvm_dir/llvm \
    -B $build_dir \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=$PWD/$install_dir \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_ENABLE_PROJECTS="clang" \
    -DLLVM_TARGETS_TO_BUILD="" \
    -DBUILD_SHARED_LIBS=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_ENABLE_TERMINFO=OFF \
    -DLLVM_ENABLE_ZLIB=OFF

ninja -C $build_dir install-libclang install-libclang-headers
