#!/bin/bash


echo "#############################"
echo "# xyce"

cd $EDA_SRCDIR/sandia-xyce-xyce

#cp -f $EDA_SRCDIR/yale-asyncvlsi-actsim/xyce-bits/N_CIR_Xyce.* $EDA_SRCDIR/sandia-xyce-xyce/src/CircuitPKG/
#cp -f $EDA_SRCDIR/yale-asyncvlsi-actsim/xyce-bits/N_CIR_XyceCInterface.* $EDA_SRCDIR/sandia-xyce-xyce/utils/XyceCInterface/

# license
cp COPYING $ACT_HOME/license/LICENSE_sandia-xyce-xyce

if [ ! -d build ]; then
	mkdir build
fi

cd $EDA_SRCDIR/sandia-xyce-xyce/build

cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D Trilinos_ROOT=$ACT_HOME \
-D CMAKE_EXE_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
$EDA_SRCDIR/sandia-xyce-xyce  || exit 1

## -D Xyce_PLUGIN_SUPPORT=ON \
cmake --build . -j 2 -t install || exit 1	
