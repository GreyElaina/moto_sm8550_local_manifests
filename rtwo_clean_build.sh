#!/bin/bash

# Original script by Nvertigo https://github.com/nvertigo/local_manifest

# if you want to build without using ccache, comment
# the next 3 lines
#export USE_CCACHE=1
#export CCACHE_EXEC=$(which ccache)
#export CCACHE_DIR=/mnt/ccache
#ccache -M 300G

# we want all compiler messages in English
export LANGUAGE=C

# set up the environment (variables and functions)
source build/envsetup.sh

# clean the out dir; comment out, if you want to do
# a dirty build
breakfast lineage_rtwo-ap1a-userdebug
make -j9 ARCH=arm clean

# fire up the building process and also log stdout
# and stderrout
brunch lineage_rtwo-ap1a-userdebug 2>&1 | tee rtwo_make.log
