#!/bin/bash

echo "#############################"
echo "# pwroute"

cd $EDA_SRCDIR/yale-asyncvlsi-pwroute
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-pwroute

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/yale-asyncvlsi-pwroute/build
cmake -DCMAKE_INSTALL_PREFIX=$ACT_HOME -DCMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" .. || exit 1
make -j || exit 1
make install || exit 1

