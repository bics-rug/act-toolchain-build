#!/bin/bash

echo "#############################"
echo "# bipart"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-bipart" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/bipart.git
  mv bipart yale-asyncvlsi-bipart
fi

