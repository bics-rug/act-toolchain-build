#!/bin/bash

echo "#############################"
echo "# xyce dependencies"

cd $EDA_SRCDIR/org-xianyi-openblas

make -j NUM_THREADS=64|| exit 1
make install PREFIX=$ACT_HOME  || exit 1
cd $ACT_HOME/lib/
ln -s libopenblas.so libblas.so
ln -s libopenblas.so liblapack.so

cd $EDA_SRCDIR/tamu-drtimothyaldendavis-suitesparse
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout master && git pull
else
   git pull
fi

cmake \
 -D SuiteSparsePath=$EDA_SRCDIR/tamu-drtimothyaldendavis-suitesparse \
 -D CMAKE_INSTALL_PREFIX=$ACT_HOME \
 $EDA_SRCDIR/yale-asyncvlsi-xyce/cmake/trilinos/AMD || exit 1
cmake --build . -t install || exit 1

cd $EDA_SRCDIR/mit-fftw-fftw
./configure --prefix=$ACT_HOME  || exit 1
make -j  || exit 1
make install  || exit 1

cd $EDA_SRCDIR/openmpi
./configure --prefix=$ACT_HOME --enable-static --with-wrapper-libs="-L$ACT_HOME/lib ${LIBS}" --with-wrapper-cxxflags="-I$ACT_HOME/include ${CXXFLAGS}" --with-wrapper-cflags="-I$ACT_HOME/include ${CFLAGS}" --with-wrapper-ldflags="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" LIBS="-L$ACT_HOME/lib ${LIBS}" CPPFLAGS="-I$ACT_HOME/include ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib"  || exit 1
make -j  || exit 1
make install  || exit 1

cd $EDA_SRCDIR/sandia-trilinos-trilinos
mkdir build
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
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib"
#-D CMAKE_EXE_LINKER_FLAGS="-L$ACT_HOME/lib -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" \
#-D CMAKE_MODULE_LINKER_FLAGS="-L$ACT_HOME/lib -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" \
#-D CMAKE_SHARED_LINKER_FLAGS="-L$ACT_HOME/lib -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" \
#-D CMAKE_STATIC_LINKER_FLAGS="-L$ACT_HOME/lib -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" \
$EDA_SRCDIR/sandia-trilinos-trilinos  || exit 1

cmake --build . -j -t install  || exit 1

#cd $EDA_SRCDIR/org-qucs-adms
#sh bootstrap.sh || exit 1
#./configure --prefix=$ACT_HOME LIBS="-L$ACT_HOME/lib ${LIBS}" CPPFLAGS="-I$ACT_HOME/include ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib"  || exit 1
#make -j  || exit 1
#make install  || exit 1
