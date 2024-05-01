#!/bin/sh

set -xe

docker run -it --rm -v $PWD:/w -w /w ubuntu:18.04
