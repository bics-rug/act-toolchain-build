#!/bin/bash

echo "#############################"
echo "# interact"

cd $EDA_SRCDIR/yale-asyncvlsi-interact
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
./configure || exit 1
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

