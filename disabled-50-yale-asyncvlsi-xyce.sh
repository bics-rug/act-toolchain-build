#!/bin/bash


echo "#############################"
echo "# xyce"

cd $EDA_SRCDIR/yale-asyncvlsi-xyce

# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-xyce

#patch xyce

cp -f $EDA_SRCDIR/yale-asyncvlsi-actsim/xyce-bits/N_CIR_Xyce.* $EDA_SRCDIR/yale-asyncvlsi-xyce/src/CircuitPKG/
cp -f $EDA_SRCDIR/yale-asyncvlsi-actsim/xyce-bits/N_CIR_XyceCInterface.* $EDA_SRCDIR/yale-asyncvlsi-xyce/utils/XyceCInterface/

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/yale-asyncvlsi-xyce/build

cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D Trilinos_ROOT=$ACT_HOME \
-D Xyce_PLUGIN_SUPPORT=ON \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
$EDA_SRCDIR/yale-asyncvlsi-xyce  || exit 1

cmake --build . -j 2 -t install  || exit 1

