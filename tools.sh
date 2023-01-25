#!/bin/sh

set -xe

apt update
apt install -y cmake wget ninja-build ccache
