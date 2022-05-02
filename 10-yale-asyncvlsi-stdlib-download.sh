#!/bin/bash

echo "#############################"
echo "# stdlib"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-stdlib" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/stdlib.git
  mv stdlib yale-asyncvlsi-stdlib
fi


