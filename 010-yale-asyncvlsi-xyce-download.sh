#!/bin/bash

echo "#############################"
echo "# xyce"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-xyce" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/xyce.git
  mv xyce $EDA_SRCDIR/yale-asyncvlsi-xyce
fi

