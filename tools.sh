#!/bin/sh

set -xe

apt update
apt install -y build-essential cmake wget ninja-build ccache python3 lsb-release
