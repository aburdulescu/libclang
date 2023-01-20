#!/bin/sh

LIBCLANG_ROOT=$(cd $(dirname $0); pwd)

export LD_LIBRARY_PATH=$LIBCLANG_ROOT/libclang/lib

echo "LIBCLANG_ROOT=$LIBCLANG_ROOT"
echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
