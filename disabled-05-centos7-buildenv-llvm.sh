#!/bin/bash
# this script assumes you are root for containers, later we can build a seperate build tool system @todo

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
cd $EDA_SRCDIR/org-llvm-llvm-project
if [ -z $CI ]; then
  echo "no CI => building, this will take a long time"
  if [ ! -d build ]; then
	mkdir build
  fi
  cd $EDA_SRCDIR/org-llvm-llvm-project/build
  cmake \
  -D LLVM_ENABLE_RTTI=ON \
  -D LLVM_INCLUDE_BENCHMARKS=OFF \
  -D CMAKE_BUILD_TYPE=Release \
  -D LLVM_BUILD_LLVM_DYLIB=ON \
  -D LLVM_INCLUDE_TESTS=OFF \
  -D LLVM_TARGETS_TO_BUILD="host;AMDGPU;X86" \
  -D LLVM_ENABLE_PROJECTS="" \
  -D LLVM_ENABLE_RUNTIMES="openmp" \
  -D LLVM_INCLUDE_EXAMPLES=OFF \
  -D LLVM_INCLUDE_TOOLS=OFF \
  -G "Unix Makefiles" \
  ../llvm
  make -j4
fi
cd $EDA_SRCDIR/org-llvm-llvm-project/build
make install
