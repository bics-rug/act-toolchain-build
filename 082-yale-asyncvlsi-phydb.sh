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
cmake -DCMAKE_INSTALL_PREFIX=$ACT_HOME -DCMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" .. || exit 1
make -j || exit 1
make install || exit 1

