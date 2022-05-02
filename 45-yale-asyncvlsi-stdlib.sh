#!/bin/bash

echo "#############################"
echo "# stdlib"

cd $EDA_SRCDIR/yale-asyncvlsi-stdlib
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
make || exit 1
make install || exit 1

