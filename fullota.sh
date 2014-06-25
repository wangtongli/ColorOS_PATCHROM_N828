#!/bin/bash

PWD=`pwd`

export PORT_DEVICE=${PWD}
mkdir -p rom

rm -rf out/framework
rm -rf new-update
cd ..
. build/envsetup.sh
cd -
make fullota
