#!/bin/sh

set -xe

version=15.0.0
arch=$(uname -m)
glibc_version=glibc_$(./glibc-version.sh)

name=libclang-"$version"-"$arch"-"linux"-"$glibc_version"
tarball="$name".tar.gz

rm -rf $name $tarball

cp -r libclang $name

strip -s $name/lib/*

cp env.sh $name/

tar czf $tarball $name
