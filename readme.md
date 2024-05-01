# libclang

Precompiled libclang.so for Linux.

## How to create a new release

Start Ubuntu 18.04(using this to have an older glibc) docker container: `./docker.sh`

Then in that container:

Install needed tools: `./tools.sh`

Build: `./build.sh`

Create tarball: `./tarball.sh`

Create release manually on github and attach tarball.
