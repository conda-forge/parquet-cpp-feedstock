#!/bin/bash

set -e
set -x

export PARQUET_BUILD_TOOLCHAIN=$PREFIX

mkdir build-dir
cd build-dir

cmake \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
    -DPARQUET_ARROW=on \
    -DPARQUET_BOOST_USE_SHARED=off \
    -DPARQUET_BUILD_BENCHMARKS=off \
    -DPARQUET_BUILD_EXECUTABLES=off \
    -DPARQUET_ZLIB_VENDORED=off \
    -DPARQUET_BUILD_TESTS=off \
    ..

make -j${CPU_COUNT}
make install
