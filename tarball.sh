#!/bin/sh

if [ $# -ne 1 ]
then
    echo "need version"
    exit 1
fi
version=$1

set -xe

arch=$(uname -m)
glibc=glibc_$(./glibc-version.sh)

name=libclang-"$version"-"$arch"-"linux"-"gcc"-"$glibc"
tarball="$name".tar.gz

rm -rf $name $tarball

cp -r libclang-dist-$version $name

strip -s $name/lib/*

cp env.sh $name/

tar czf $tarball $name
