#!/bin/bash

echo "#############################"
echo "# Async memory compiler"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-amc" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/amc.git
  mv amc yale-asyncvlsi-amc
fi

