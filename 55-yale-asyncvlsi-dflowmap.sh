#!/bin/bash

echo "#############################"
echo "# dflowmap"

cd $EDA_SRCDIR/yale-asyncvlsi-dflowmap
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-dflowma

./configure 
if [ ! -d build ]; then
	mkdir build
fi
cd build
cmake -DCMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" .. || exit 1
make -j || exit 1
make install || exit 1

