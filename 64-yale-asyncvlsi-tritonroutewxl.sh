#!/bin/bash

echo "#############################"
echo "# tritonroutewxl"

cd $EDA_SRCDIR/yale-asyncvlsi-tritonroutewxl
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-tritonroutewxl

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/yale-asyncvlsi-tritonroutewxl/build
cmake -DCMAKE_INSTALL_PREFIX=$ACT_HOME -DCMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" .. || exit 1
make -j2 || exit 1
make install || exit 1

