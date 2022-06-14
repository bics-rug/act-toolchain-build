#!/bin/bash

echo "#############################"
echo "# bipart"

cd $EDA_SRCDIR/yale-asyncvlsi-bipart
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-bipart

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/yale-asyncvlsi-bipart/build
cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
-D CMAKE_BUILD_TYPE=Release \
.. || exit 1
make || exit 1
make install || exit 1

