#!/bin/bash

echo "#############################"
echo "# Dali placer"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-dali" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/dali.git
  mv dali yale-asyncvlsi-dali
fi

