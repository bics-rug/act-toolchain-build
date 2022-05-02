#!/bin/bash

echo "#############################"
echo "# phydb"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-phydb" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/phydb.git
  mv phydb yale-asyncvlsi-phydb
fi
