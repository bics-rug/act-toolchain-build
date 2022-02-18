#!/bin/bash

echo "#############################"
echo "# interact"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-interact" ]; then
cd $EDA_SRCDIR
  git clone https://github.com/asyncvlsi/interact.git
  mv interact yale-asyncvlsi-interact
fi
cd $EDA_SRCDIR/yale-asyncvlsi-interact
git reset --hard && git checkout main && git pull
./configure || exit 1
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

