#!/bin/sh

set -xe

apt update
apt install -y clang cmake wget ninja-build ccache lsb-release
