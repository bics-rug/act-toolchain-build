#!/bin/bash

echo "#############################"
echo "# sproute"

cd $EDA_SRCDIR/yale-asyncvlsi-sproute
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-sproute

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/yale-asyncvlsi-sproute/build
cmake -DCMAKE_INSTALL_PREFIX=$ACT_HOME -DCMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" .. || exit 1
make -j || exit 1
make install || exit 1

