#!/bin/sh

set -xe

install_cmake() {
    rm -f cmake-3.21.0-linux-x86_64.sh
    wget https://cmake.org/files/v3.21/cmake-3.21.0-linux-x86_64.sh
    sh cmake-3.21.0-linux-x86_64.sh --skip-license --exclude-subdir --prefix=/usr/local
}

apt update
apt install -y build-essential wget ninja-build ccache python3

which cmake || install_cmake
