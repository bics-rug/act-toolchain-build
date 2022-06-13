#!/bin/bash

echo "#############################"
echo "# dali"

cd $EDA_SRCDIR/yale-asyncvlsi-dali
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-dali

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/yale-asyncvlsi-dali/build
cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
-D CMAKE_BUILD_TYPE=Release \
.. || exit 1
make 2> install.log || exit 1
make install || exit 1

