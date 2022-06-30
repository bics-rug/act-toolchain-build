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

cd $EDA_SRCDIR/sandia-xyce-xyce/utils/XyceCInterface

sed -i 's/#include <N_DEV_Algorithm.h>/ /' N_CIR_XyceCInterface.C
g++ -I$ACT_HOME/include -I. -c N_CIR_XyceCInterface.C -fPIC || exit 1	

ar ruv libxycecinterface.a N_CIR_XyceCInterface.o || exit 1	

#ranlib libxycecinterface.a
cp libxycecinterface.a $ACT_HOME/lib/
cp N_CIR_XyceCInterface.h $ACT_HOME/include/
