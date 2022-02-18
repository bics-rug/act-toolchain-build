#!/bin/bash

echo "#############################"
echo "# stdlib"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-stdlib" ]; then
cd $EDA_SRCDIR
  git clone https://github.com/asyncvlsi/stdlib.git
  mv stdlib yale-asyncvlsi-stdlib
fi
cd $EDA_SRCDIR/yale-asyncvlsi-stdlib
git reset --hard && git checkout main && git pull
make || exit 1
make install || exit 1

