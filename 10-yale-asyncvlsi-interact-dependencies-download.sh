#!/bin/bash

# download all dependencies from scrach so we have an almost dependency independent package


echo "#############################"
echo "# boost"

if [ ! -d "$EDA_SRCDIR/org-boostorg-boost" ]; then
cd $EDA_SRCDIR
#  git clone --depth 1 --recursive --branch master https://github.com/boostorg/boost.git
#  mv boost org-boostorg-boost
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
    curl --user $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/llvm-14.x-prebuild.tar.gz --output llvm-14.x.tar.gz
    echo "4f55b02bf169897c3c07d0397c77bad6f9802a465ff4006179a64450afd0d2c0 llvm-14.x.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-llvm-llvm-project
    tar -C "$EDA_SRCDIR/org-llvm-llvm-project" --strip-components=1 -xf llvm-14.x.tar.gz
    rm llvm-14.x.tar.gz
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
    curl --user $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/mpich-4.0.2-prebuild.tar.gz --output mpich-4.0.2.tar.gz
    echo "509c5d0a6f3cc920d559e5622b621a7a8223f7422477dc912a13e9cae8717814 mpich-4.0.2.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-pmodels-mpich
    tar -C "$EDA_SRCDIR/org-pmodels-mpich" --strip-components=1 -xf mpich-4.0.2.tar.gz
    rm mpich-4.0.2.tar.gz
  else
    echo "download & check"
    wget --quiet https://www.mpich.org/static/downloads/4.0.2/mpich-4.0.2.tar.gz
    echo "5a42f1a889d4a2d996c26e48cbf9c595cbf4316c6814f7c181e3320d21dedd42 mpich-4.0.2.tar.gz" | sha256sum --check || exit 1
    mkdir $EDA_SRCDIR/org-pmodels-mpich
    tar -C "$EDA_SRCDIR/org-pmodels-mpich" --strip-components=1 -xf mpich-4.0.2.tar.gz
    rm mpich-4.0.2.tar.gz
  fi
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