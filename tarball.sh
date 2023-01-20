#!/bin/sh

set -xe

version=15.0.0
arch=$(uname -m)
os=$(lsb_release -si)
os_version=$(lsb_release -si)

tarball=libclang-$version-$arch-$os_$os_version.tar.gz

rm $tarball

strip -s libclang/lib/*

cp env.sh libclang/

tar czf $tarball libclang
