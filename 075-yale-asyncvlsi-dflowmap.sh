#!/bin/bash

echo "#############################"
echo "# dflowmap"

cd $EDA_SRCDIR/yale-asyncvlsi-dflowmap
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-dflowmap

./configure 
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

