#!/bin/bash

echo "#############################"
echo "# actsim"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-actsim" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/actsim.git
  mv actsim yale-asyncvlsi-actsim
fi

