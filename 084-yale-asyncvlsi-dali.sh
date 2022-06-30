#!/bin/bash

# Dali build is broken with gcc11, allow to fail

echo "#############################"
echo "# dali"

cd $EDA_SRCDIR/yale-asyncvlsi-dali
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-dali

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRCDIR/yale-asyncvlsi-dali/build
rmdir $EDA_SRCDIR/yale-asyncvlsi-dali/module/eigen-git-mirror
ln -s $EDA_SRCDIR/org-libeigen-eigen $EDA_SRCDIR/yale-asyncvlsi-dali/module/eigen-git-mirror
cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D CMAKE_EXE_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_BUILD_TYPE=Release \
.. #|| exit 1
make # 2> install.log #|| exit 1
make install #|| exit 1

