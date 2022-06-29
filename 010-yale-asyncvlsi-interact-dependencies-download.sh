#!/bin/bash

# download all dependencies from scrach so we have an almost dependency independent package


echo "#############################"
echo "# boost"

if [ ! -d "$EDA_SRCDIR/org-boostorg-boost" ]; then
cd $EDA_SRCDIR
  if [ ! -z $CI ]; then
    echo "download & check prebuild"
    wget --quiet https://github.com/bics-rug/act-toolchain-prebuildfiles/raw/master/boost_1_79_0-prebuild.tar.gz
    echo "2839c7fc868c032c5a73e5c63aebc605f35b4f2e0dac15b865ff5bede2f2ad6e boost_1_79_0-prebuild.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-boostorg-boost-prebuild
    tar -C "$EDA_SRCDIR/org-boostorg-boost-prebuild" --strip-components=2 -xf boost_1_79_0-prebuild.tar.gz
    rm boost_1_79_0-prebuild.tar.gz
  fi
    echo "download & check"
    wget --quiet https://boostorg.jfrog.io/artifactory/main/release/1.79.0/source/boost_1_79_0.tar.gz
    echo "273f1be93238a068aba4f9735a4a2b003019af067b9c183ed227780b8f36062c boost_1_79_0.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-boostorg-boost
    tar -C "$EDA_SRCDIR/org-boostorg-boost" --strip-components=1 -xf boost_1_79_0.tar.gz
    rm boost_1_79_0.tar.gz
fi

echo "#############################"
echo "# numactl"

if [ ! -d "$EDA_SRCDIR/org-numactl-numactl" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/numactl/numactl.git
  mv numactl org-numactl-numactl
fi

echo "#############################"
echo "# fmt"

if [ ! -d "$EDA_SRCDIR/org-fmtlib-fmt" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 -b master https://github.com/fmtlib/fmt.git
  mv fmt $EDA_SRCDIR/org-fmtlib-fmt
fi

echo "#############################"
echo "# llvm"
if [ ! -d "$EDA_SRCDIR/org-llvm-llvm-project" ]; then
  if [ ! -z $CI ]; then
    echo "download & check prebuild"
wget --quiet https://github.com/bics-rug/act-toolchain-prebuildfiles/raw/master/llvm-14.x-prebuild.tar.gz
    echo "4f55b02bf169897c3c07d0397c77bad6f9802a465ff4006179a64450afd0d2c0 llvm-14.x-prebuild.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-llvm-llvm-project
    tar -C "$EDA_SRCDIR/org-llvm-llvm-project" --strip-components=1 -xf llvm-14.x-prebuild.tar.gz
    rm llvm-14.x-prebuild.tar.gz
  else
    cd $EDA_SRCDIR
    git clone --depth 1 --branch release/14.x https://github.com/llvm/llvm-project.git
    mv llvm-project org-llvm-llvm-project
    mkdir $EDA_SRCDIR/org-llvm-llvm-project/build
  fi
fi

echo "#############################"
echo "# MPICH"
if [ ! -d "$EDA_SRCDIR/org-pmodels-mpich" ]; then
  cd $EDA_SRCDIR
    #git clone --depth 1 --branch 4.0.x https://github.com/pmodels/mpich.git
    #mv mpich org-pmodels-mpich
    if [ ! -z $CI ]; then
    echo "download & check prebuild"
    wget --quiet https://github.com/bics-rug/act-toolchain-prebuildfiles/raw/master/mpich-4.0.2-prebuild.tar.gz
    echo "cab06bbe4bb4f94bc831cf68c7460fdfb11d5984ca686fcd877050552eaa27a6 mpich-4.0.2-prebuild.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-pmodels-mpich-prebuild
    tar -C "$EDA_SRCDIR/org-pmodels-mpich-prebuild" --strip-components=1 -xf mpich-4.0.2-prebuild.tar.gz
    rm mpich-4.0.2-prebuild.tar.gz
  fi
    echo "download & check"
    wget --quiet https://www.mpich.org/static/downloads/4.0.2/mpich-4.0.2.tar.gz
    echo "5a42f1a889d4a2d996c26e48cbf9c595cbf4316c6814f7c181e3320d21dedd42 mpich-4.0.2.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-pmodels-mpich
    tar -C "$EDA_SRCDIR/org-pmodels-mpich" --strip-components=1 -xf mpich-4.0.2.tar.gz
    rm mpich-4.0.2.tar.gz
fi

echo "#############################"
echo "# galois"

if [ ! -d "$EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 -b master https://github.com/IntelligentSoftwareSystems/Galois
  mv Galois $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois
fi

echo "#############################"
echo "# eigen"

if [ ! -d "$EDA_SRCDIR/org-libeigen-eigen" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 -b 3.4 https://gitlab.com/libeigen/eigen.git
  mv eigen $EDA_SRCDIR/org-libeigen-eigen
fi