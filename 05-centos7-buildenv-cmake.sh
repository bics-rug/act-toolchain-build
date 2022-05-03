#!/bin/bash
# this script assumes you are root for containers, later we can build a seperate build tool system @todo
echo "#############################"
echo "#build cmake"
if [ ! -d "cmake" ]; then
  if [ ! -z $CI ]; then
    echo "download & check"
    curl --user $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/cmake-3.23.1-prebuild.tar.gz --output cmake-3.23.1.tar.gz
    echo "ec8ce8408fae2cde2c281c3a7a9e336ca88c5585e2ed4062ab32791b72c980d8 cmake-3.23.1.tar.gz" | sha256sum --check || exit 1
    mkdir cmake
    tar -C "cmake" --strip-components=1 -xf cmake-3.23.1.tar.gz
    rm cmake-3.23.1.tar.gz
  else

    echo "download & check"
    wget --quiet https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz
    echo "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3 cmake-3.23.1.tar.gz" | sha256sum --check || exit 1
    mkdir cmake
    tar -C "cmake" --strip-components=1 -xf cmake-3.23.1.tar.gz
    rm cmake-3.23.1.tar.gz
  fi
fi
cd cmake
if [ -z $CI ]; then
  echo "no CI => building"
  ./bootstrap --prefix=/usr -- -DCMAKE_USE_OPENSSL=OFF
  make
fi
make install
