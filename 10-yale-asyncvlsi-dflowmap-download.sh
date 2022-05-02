#!/bin/bash

echo "#############################"
echo "# dflowmap"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-dflowmap" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/dflowmap.git
  mv dflowmap yale-asyncvlsi-dflowmap
fi
