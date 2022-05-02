#!/bin/bash
# this script assumes you are root for containers, later we can build a seperate build tool system
echo "#############################"
echo "#build cmake"
if [ ! -d "cmake" ]; then
  echo "download & check"
  wget --quiet https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz
  echo "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3 cmake-3.23.1.tar.gz" | sha256sum --check || exit 1
  mkdir cmake
  tar -C "cmake" --strip-components=1 -xf cmake-3.23.1.tar.gz
  rm cmake-3.23.1.tar.gz
fi
cd cmake
./bootstrap --prefix=/usr -- -DCMAKE_USE_OPENSSL=OFF
make
make install
