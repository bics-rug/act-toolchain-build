#!/bin/bash

echo "#############################"
echo "# phydb"

cd $EDA_SRCDIR/yale-asyncvlsi-phydb
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
if [ ! -d build ]; then
	mkdir build
fi
cd build
cmake -DCMAKE_INSTALL_RPATH="\$ORIGIN/../lib,$ACT_HOME/lib" .. || exit 1
make -j || exit 1
make install || exit 1

