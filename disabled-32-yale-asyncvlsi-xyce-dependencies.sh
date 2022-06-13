#!/bin/bash

echo "#############################"
echo "# xyce dependencies"

echo "# BLAS"

cd $EDA_SRCDIR/org-xianyi-openblas
# license
cp LICENSE $ACT_HOME/license/LICENSE_org-xianyi-openblas

make -j NUM_THREADS=64 || exit 1
make install PREFIX=$ACT_HOME  || exit 1
cd $ACT_HOME/lib/
ln -s libopenblas.so libblas.so
ln -s libopenblas.so liblapack.so

echo "#############################"
echo "# suitesparse"
cd $EDA_SRCDIR/tamu-drtimothyaldendavis-suitesparse
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout master && git pull
else
   git pull
fi
# license
cp LICENSE.txt $ACT_HOME/license/LICENSE_tamu-drtimothyaldendavis-suitesparse

cmake \
 -D SuiteSparsePath=$EDA_SRCDIR/tamu-drtimothyaldendavis-suitesparse \
 -D CMAKE_INSTALL_PREFIX=$ACT_HOME \
 -D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
 $EDA_SRCDIR/yale-asyncvlsi-xyce/cmake/trilinos/AMD || exit 1
cmake --build . -t install || exit 1
cp ../LICENSE $ACT_HOME/license/LICENSE_



echo "#############################"
echo "# trilinos"

cd $EDA_SRCDIR/sandia-trilinos-trilinos
if [ ! -d build ]; then
	mkdir build
fi
# license
cp LICENSE $ACT_HOME/license/LICENSE_sandia-trilinos-trilinos
cat Copyright.txt >> $ACT_HOME/license/LICENSE_sandia-trilinos-trilinos
cd build

cmake \
-C $EDA_SRCDIR/yale-asyncvlsi-xyce/cmake/trilinos/trilinos-config-MPI.cmake \
-D CMAKE_C_COMPILER=mpicc \
-D CMAKE_CXX_COMPILER=mpicxx \
-D CMAKE_Fortran_COMPILER=mpifort \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D AMD_LIBRARY_DIRS=$ACT_HOME/lib \
-D AMD_INCLUDE_DIRS=$ACT_HOME/include \
-D BLAS_LIBRARY_DIRS=$ACT_HOME/lib \
-D LAPACK_LIBRARY_DIRS=$ACT_HOME/lib \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
$EDA_SRCDIR/sandia-trilinos-trilinos || exit 1

cmake --build . -j -t install  || exit 1


# @TODO
#cd $EDA_SRCDIR/org-qucs-adms
#cp LICENSE $ACT_HOME/license/LICENSE_org-qucs-adms
#sh bootstrap.sh || exit 1
#./configure --prefix=$ACT_HOME LIBS="-L$ACT_HOME/lib ${LIBS}" CPPFLAGS="-I$ACT_HOME/include ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib"  || exit 1
#make -j  || exit 1
#make install  || exit 1
