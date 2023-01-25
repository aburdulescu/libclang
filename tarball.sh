#!/bin/sh

set -xe

version=15.0.0
arch=$(uname -m)
os=$(lsb_release -si)_$(lsb_release -sr)
glibc=glibc_$(./glibc-version.sh)

name=libclang-"$version"-"$arch"-"$os"-"$glibc"
tarball="$name".tar.gz

rm -rf $name $tarball

cp -r libclang $name

strip -s $name/lib/*

cp env.sh $name/

tar czf $tarball $name
