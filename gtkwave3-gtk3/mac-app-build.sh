#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

SOURCE_DIR=$(dirname "$0")
SOURCE_DIR=$(readlink -f "$SOURCE_DIR")
CONFIGURE_SCRIPT="$SOURCE_DIR/configure"

configureFlags="${configureFlags:+}"
ORIG_CPPFLAGS="${CPPFLAGS:+}"
ORIG_CFLAGS="${CFLAGS:+}"
ORIG_CXXFLAGS="${CXXFLAGS:+}"
ORIG_LDFLAGS="${LDFLAGS:+}"

for arch in x86_64 arm64; do
    export CPPFLAGS="$ORIG_CPPFLAGS -arch $arch"
    export CFLAGS="$ORIG_CFLAGS -arch $arch"
    export CXXFLAGS="$ORIG_CXXFLAGS -arch $arch"
    export LDFLAGS="$ORIG_LDFLAGS -arch $arch"
    mkdir -p build-$arch prefix-$arch
    rm -rf build-$arch/* prefix-$arch/*
    pushd build-$arch
    "$CONFIGURE_SCRIPT" --prefix "$(readlink -f "../prefix-$arch")" "$configureFlags"
    make -j "$(nproc)" install
    popd
done
