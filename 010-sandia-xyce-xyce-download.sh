#!/bin/bash

echo "#############################"
echo "# xyce"

if [ ! -d "$EDA_SRCDIR/sandia-xyce-xyce" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/xyce/xyce.git
  mv xyce $EDA_SRCDIR/sandia-xyce-xyce
fi

