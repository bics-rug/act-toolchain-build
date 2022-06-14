#!/bin/bash

# this file builds
# - MPICH -> MPI
# - Boost
# - Numactl
# - fmt
# - libLLVM
# - FFTW
# - Eigen

echo "#############################"
echo "# interact and route dependencies"
echo "# MPICH"

cd $EDA_SRCDIR/org-pmodels-mpich
cp COPYRIGHT $ACT_HOME/license/LICENSE_org-pmodels-mpich

if [ -z $CI ]; then
  echo "no CI => building, this will take a long time"

  #./autogen.sh
  ./configure --prefix=$ACT_HOME --enable-fast=O3 FFLAGS=-fallow-argument-mismatch FCFLAGS=-fallow-argument-mismatch
  make -j2 || exit 1
else
  cd $EDA_SRCDIR
  if [ -d $EDA_SRCDIR/org-pmodels-mpich-prebuild ]; then
    rm -rf $EDA_SRCDIR/org-pmodels-mpich
    mv $EDA_SRCDIR/org-pmodels-mpich-prebuild $EDA_SRCDIR/org-pmodels-mpich
  fi
  cd $EDA_SRCDIR/org-pmodels-mpich
fi
make install || exit 1

# MPICH is active because required
# cd $EDA_SRCDIR/openmpi
# ./configure --prefix=$ACT_HOME --enable-static --with-wrapper-libs="-L$ACT_HOME/lib ${LIBS}" --with-wrapper-cxxflags="-I$ACT_HOME/include ${CXXFLAGS}" --with-wrapper-cflags="-I$ACT_HOME/include ${CFLAGS}" --with-wrapper-ldflags="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" LIBS="-L$ACT_HOME/lib ${LIBS}" CPPFLAGS="-I$ACT_HOME/include ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib"  || exit 1
# make -j  || exit 1
# make install  || exit 1

echo "#############################"
echo "# Boost"
cd $EDA_SRCDIR/org-boostorg-boost
cp LICENSE_1_0.txt $ACT_HOME/license/LICENSE_org-boostorg-boost
if [ -z $CI ]; then
  
  echo "no CI => building"
  echo "using mpi ;" >> user-config.jam
  ./bootstrap.sh --prefix=$ACT_HOME --without-libraries=python || exit 1
  echo "using mpi ;" >> project-config.jam
else
  cd $EDA_SRCDIR
  if [ -d $EDA_SRCDIR/org-boostorg-boost-prebuild ];then
    rm -rf $EDA_SRCDIR/org-boostorg-boost
    mv $EDA_SRCDIR/org-boostorg-boost-prebuild $EDA_SRCDIR/org-boostorg-boost
  fi
  cd $EDA_SRCDIR/org-boostorg-boost
fi
./b2 install || exit 1

echo "#############################"
echo "# numactl"
cd $EDA_SRCDIR/org-numactl-numactl
./autogen.sh
./configure --prefix=$ACT_HOME
make -j || exit 1
make install || exit 1
cp LICENSE.GPL2 $ACT_HOME/license/LICENSE_org-numactl-numactl
cat LICENSE.LGPL2.1 >> $ACT_HOME/license/LICENSE_org-numactl-numactl

echo "#############################"
echo "# fmt"
cd $EDA_SRCDIR/org-fmtlib-fmt
cp LISENCE.rst $ACT_HOME/license/LICENSE_org-fmtlib-fmt

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/org-fmtlib-fmt/build
cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_POSITION_INDEPENDENT_CODE=TRUE \
-D BUILD_SHARED_LIBS=TRUE \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
 .. || exit 1
make -j || exit 1
make install || exit 1

echo "#############################"
echo "#build llvm"

cd $EDA_SRCDIR/org-llvm-llvm-project
cp llvm/LICENSE.TXT $ACT_HOME/license/LICENSE_org-llvm-llvm-project

  #echo "no CI => building, this will take a long time"
  if [ ! -d build ]; then
	mkdir build
  fi
  cd $EDA_SRCDIR/org-llvm-llvm-project/build
  cmake \
  -D LLVM_ENABLE_RTTI=ON \
  -D CMAKE_INSTALL_PREFIX=$ACT_HOME \
  -D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
  -D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
  -D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
  -D LLVM_INCLUDE_BENCHMARKS=OFF \
  -D CMAKE_BUILD_TYPE=Release \
  -D LLVM_BUILD_LLVM_DYLIB=ON \
  -D LLVM_INCLUDE_TESTS=OFF \
  -D LLVM_TARGETS_TO_BUILD="host;AMDGPU;X86" \
  -D LLVM_ENABLE_PROJECTS="" \
  -D LLVM_ENABLE_RUNTIMES="" \
  -D LLVM_INCLUDE_EXAMPLES=OFF \
  -D LLVM_INCLUDE_TOOLS=OFF \
  -G "Unix Makefiles" \
  ../llvm
  make -j4 || exit 1
cd $EDA_SRCDIR/org-llvm-llvm-project/build
make install || exit 1

echo "#############################"
echo "# fftw"

cd $EDA_SRCDIR/mit-fftw-fftw
# license
cp COPYRIGHT $ACT_HOME/license/LICENSE_mit-fftw-fftw
cat COPYING >> $ACT_HOME/license/LICENSE_mit-fftw-fftw

./configure --prefix=$ACT_HOME \
 CFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib -fPIC" \
 CPPFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib -fPIC" \
 LDFLAGS="-L${ACT_HOME}/lib -Wl,-rpath=\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib" || exit 1
make -j  || exit 1
make install  || exit 1



echo "#############################"
echo "# eigen"

cd $EDA_SRCDIR/org-libeigen-eigen
cp COPYING.README $ACT_HOME/license/LICENSE_org-libeigen-eigen
cat COPYING.* >> $ACT_HOME/license/LICENSE_org-libeigen-eigen
if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/org-libeigen-eigen/build
cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
-D CMAKE_BUILD_TYPE=Release \
..
make -j4
make install

ln -s $ACT_HOME/include/eigen3/Eigen $ACT_HOME/include/Eigen

echo "#############################"
echo "# galois"
cd $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois
cp LICENSE.txt $ACT_HOME/license/LICENSE_utexas-intelligentsoftwaresystems-galois

if [ ! -d build ]; then
	mkdir build
fi
# fixing upsteam build bug for GCC11
mv $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois/tools/graph-convert/graph-convert.cpp $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois/tools/graph-convert/graph-convert.cpp.orginal

echo "#include <optional>" | cat - $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois/tools/graph-convert/graph-convert.cpp.orginal > $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois/tools/graph-convert/graph-convert.cpp

cd $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois/build
cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" \
-D CMAKE_BUILD_TYPE=Release \
-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
-D CMAKE_INSTALL_LIBDIR=$ACT_HOME/lib \
.. || exit 1
make || exit 1
make install || exit 1

