#!/bin/bash

# this file builds
# - BLAS
# - SuiteSparce
# - Trilinos
# - ADMS (disabled)
#
# FTTW is build by 040-yale-asyncvlsi-interact-dependencies.sh
# MPI is build by 040-yale-asyncvlsi-interact-dependencies.sh

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
# license
cp LICENSE.txt $ACT_HOME/license/LICENSE_tamu-drtimothyaldendavis-suitesparse

cmake \
 -D SuiteSparsePath=$EDA_SRCDIR/tamu-drtimothyaldendavis-suitesparse \
 -D CMAKE_INSTALL_PREFIX=$ACT_HOME \
 -D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
 -D CMAKE_POSITION_INDEPENDENT_CODE=ON \
 $EDA_SRCDIR/sandia-xyce-xyce/cmake/trilinos/AMD || exit 1
cmake --build . -t install || exit 1

echo "#############################"
echo "# trilinos"

cd $EDA_SRCDIR/sandia-trilinos-trilinos
if [ ! -d build ]; then
	mkdir build
fi
# license
cp LICENSE $ACT_HOME/license/LICENSE_sandia-trilinos-trilinos
cat Copyright.txt >> $ACT_HOME/license/LICENSE_sandia-trilinos-trilinos
cd $EDA_SRCDIR/sandia-trilinos-trilinos/build

cmake \
-G "Unix Makefiles" \
-D CMAKE_C_COMPILER=gcc \
-D CMAKE_CXX_COMPILER=g++ \
-D CMAKE_Fortran_COMPILER=gfortran \
-D CMAKE_CXX_FLAGS="-O3 -fPIC" \
-D CMAKE_C_FLAGS="-O3 -fPIC" \
-D CMAKE_Fortran_FLAGS="-O3 -fPIC" \
-D CMAKE_MAKE_PROGRAM="make" \
-D Trilinos_ENABLE_NOX=ON \
-D NOX_ENABLE_LOCA=ON \
-D Trilinos_ENABLE_EpetraExt=ON \
-D EpetraExt_BUILD_BTF=ON \
-D EpetraExt_BUILD_EXPERIMENTAL=ON \
-D EpetraExt_BUILD_GRAPH_REORDERINGS=ON \
-D Trilinos_ENABLE_TrilinosCouplings=ON \
-D Trilinos_ENABLE_Ifpack=ON \
-D Trilinos_ENABLE_AztecOO=ON \
-D Trilinos_ENABLE_Belos=ON \
-D Trilinos_ENABLE_Teuchos=ON \
-D Trilinos_ENABLE_COMPLEX_DOUBLE=ON \
-D Trilinos_ENABLE_Amesos=ON \
-D Amesos_ENABLE_KLU=ON \
-D Trilinos_ENABLE_Amesos2=ON \
-D Amesos2_ENABLE_KLU2=ON \
-D Amesos2_ENABLE_Basker=ON \
-D Trilinos_ENABLE_Sacado=ON \
-D Trilinos_ENABLE_Stokhos=ON \
-D Trilinos_ENABLE_Kokkos=ON \
-D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES=OFF \
-D Trilinos_ENABLE_CXX11=ON \
-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
-D TPL_ENABLE_AMD=ON \
-D AMD_LIBRARY_DIRS=$ACT_HOME/lib \
-D TPL_AMD_INCLUDE_DIRS=$ACT_HOME/include \
-D TPL_ENABLE_BLAS=ON \
-D TPL_ENABLE_LAPACK=ON \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
$EDA_SRCDIR/sandia-trilinos-trilinos || exit 1

#cmake \
#-C $EDA_SRCDIR/sandia-xyce-xyce/cmake/trilinos/trilinos-config.cmake \
#-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
#-D AMD_LIBRARY_DIRS=$ACT_HOME/lib \
#-D AMD_INCLUDE_DIRS=$ACT_HOME/include \
#-D BLAS_LIBRARY_DIRS=$ACT_HOME/lib \
#-D LAPACK_LIBRARY_DIRS=$ACT_HOME/lib \
#-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
#-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
#$EDA_SRCDIR/sandia-trilinos-trilinos | exit 1

#-C $EDA_SRCDIR/sandia-xyce-xyce/cmake/trilinos/trilinos-config-MPI.cmake \
#-D CMAKE_C_COMPILER=mpicc \
#-D CMAKE_CXX_COMPILER=mpicxx \
#-D CMAKE_Fortran_COMPILER=mpifort \

cmake --build . -j2 -t install  || exit 1

#echo "#############################"
#echo "# adms"
#
#cd $EDA_SRCDIR/org-qucs-adms
#cp LICENSE $ACT_HOME/license/LICENSE_org-qucs-adms
#sh bootstrap.sh || exit 1
#./configure --prefix=$ACT_HOME \
#   LIBS="-L$ACT_HOME/lib ${LIBS}" \
#   CPPFLAGS="-I$ACT_HOME/include ${CPPFLAGS}" \
#   LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib"  || exit 1
#make -j  || exit 1
#make install  || exit 1
