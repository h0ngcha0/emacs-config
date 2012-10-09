#!/bin/bash

set -e
base_dir=$PWD
edts_dir=$base_dir/lib/edts/
magit_dir=$base_dir/lib/magit/

case `uname` in
    Linux)   make="make";;
    FreeBSD) make="gmake";;
    Darwin)  make="make";;
    *)       exit 2;;
esac

build_edts() {
    cd $edts_dir
    $make
}

build_magit() {
    cd $magit_dir
    $make
    sudo $make install
}

git submodule update --init

build_edts
build_magit
