#!/bin/bash

echo "#############################"
echo "# phydb"

cd $EDA_SRCDIR/yale-asyncvlsi-phydb
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-phydb

if [ ! -d build ]; then
	mkdir build
fi
cd build
cmake \
 -D CMAKE_INSTALL_PREFIX=$ACT_HOME \
 -D CMAKE_EXE_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
 -D CMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
  .. || exit 1
make -j || exit 1
make install || exit 1

