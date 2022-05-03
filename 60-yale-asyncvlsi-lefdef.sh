#!/bin/bash

echo "#############################"
echo "# lef def"

cd $EDA_SRCDIR/yale-asyncvlsi-lefdef
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
make || exit 1
make install || exit 1

