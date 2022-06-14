#!/bin/bash


echo "#############################"
echo "# xyce"

cd $EDA_SRCDIR/sandia-xyce-xyce

#cp -f $EDA_SRCDIR/yale-asyncvlsi-actsim/xyce-bits/N_CIR_Xyce.* $EDA_SRCDIR/sandia-xyce-xyce/src/CircuitPKG/
#cp -f $EDA_SRCDIR/yale-asyncvlsi-actsim/xyce-bits/N_CIR_XyceCInterface.* $EDA_SRCDIR/sandia-xyce-xyce/utils/XyceCInterface/

# license
cp COPYING $ACT_HOME/license/LICENSE_sandia-xyce-xyce

./bootstrap
./configure \
 --enable-fftw \
 --enable-radmodels \
 --enable-admsmodels \
 --enable-neuronmodels \
 --enable-radmodels \
 --enable-admsmodels \
 --enable-neuronmodels \
 --enable-isorropia \
 --enable-zoltan \
 --enable-pardiso_mkl \
 --enable-hdf5 \
 --enable-stokhos \
 --enable-amd \
 --prefix=$ACT_HOME \
 --enable-shared=yes \
 CFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib -fPIC" \
 CXXFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib -fPIC" \
 CPPFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib" \
 LDFLAGS="-L${ACT_HOME}/lib -Wl,-rpath=\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib" || exit 1
# #LIBS=" ${ACT_HOME}/lib/libkokkoscore.a ${ACT_HOME}/lib/libkokkoskernals.a ${ACT_HOME}/lib/libkokkosalgorithms.a ${ACT_HOME}/lib/libkokkoscontainers.a ${ACT_HOME}/lib/libteuchoskokkoscomm.a ${ACT_HOME}/lib/libteuchoskokkoscompat.a "
#
make || exit 1
make install || exit 1

 #  --enable-shylu \
 #  --enable-superludist \
 #  --enable-superlu \
 #  --enable-rol \
 #  --enable-mpi \
 #  --enable-amesos2 \


if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/sandia-xyce-xyce/build

cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D Trilinos_ROOT=$ACT_HOME \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
$EDA_SRCDIR/sandia-xyce-xyce  || exit 1

## -D Xyce_PLUGIN_SUPPORT=ON \
cmake --build . -j 2 || exit 1	