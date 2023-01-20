#!/bin/sh

set -xe

version=15.0.0
arch=$(uname -m)
os=$(lsb_release -si)
os_version=$(lsb_release -sr)

name=libclang-"$version"-"$arch"-"$os"_"$os_version"
tarball="$name".tar.gz

rm -rf $name $tarball

cp -r libclang $name

strip -s $name/lib/*

cp env.sh $name/

tar czf $tarball $name
