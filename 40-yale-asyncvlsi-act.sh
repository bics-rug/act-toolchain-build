#!/bin/bash

echo "#############################"
echo "# act"

cd $VLSI_TOOLS_SRC

if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout master && git pull
else
   git pull
fi
./configure $ACT_HOME CFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib" || exit 1
make realclean 2> /dev/null
./build || exit 1
make install || exit 1

