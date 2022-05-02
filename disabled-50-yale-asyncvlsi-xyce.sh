#!/bin/bash


echo "#############################"
echo "# xyce"

cd $EDA_SRCDIR/yale-asyncvlsi-xyce
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi

mkdir xyce-build
cd xyce-build

cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D Trilinos_ROOT=$ACT_HOME \
-D Xyce_PLUGIN_SUPPORT=ON \
$EDA_SRCDIR/yale-asyncvlsi-xyce  || exit 1

cmake --build . -j 2 -t install  || exit 1

