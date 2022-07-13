#!/bin/bash
# this script assumes you are root for containers, later we can build a seperate build tool system @todo
echo "#############################"
echo "#build cmake"
if [ ! -d "cmake" ]; then
  if [ ! -z $CI ]; then
    echo "prebuild download & check"
    wget --quiet https://github.com/bics-rug/act-toolchain-prebuildfiles/raw/master/cmake-3.23.2-prebuild.tar.gz
    echo "b9fcd93f12c48a359026a8bec2b2bfa7bda13ce55698fcad0db8337f2320e9f7 cmake-3.23.2-prebuild.tar.gz" | sha256sum --check || exit 1
    mkdir cmake
    tar -C "cmake" --strip-components=1 -xf cmake-3.23.2-prebuild.tar.gz
    rm cmake-3.23.2-prebuild.tar.gz
  else

    echo "download & check"
    wget --quiet https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2.tar.gz
    echo "f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa cmake-3.23.2.tar.gz" | sha256sum --check || exit 1
    mkdir cmake
    tar -C "cmake" --strip-components=1 -xf cmake-3.23.2.tar.gz
    rm cmake-3.23.2.tar.gz
  fi
fi
cd cmake
if [ -z $CI ]; then
  echo "no CI => building"
  ./bootstrap --prefix=/usr -- -DCMAKE_USE_OPENSSL=OFF
  make
fi
make install
