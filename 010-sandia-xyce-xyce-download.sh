#!/bin/bash

echo "#############################"
echo "# xyce"

# https://xyce.sandia.gov/files/xyce/Xyce-7.5.tar.gz

if [ ! -d "$EDA_SRCDIR/sandia-xyce-xyce" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/xyce/xyce.git
  mv xyce $EDA_SRCDIR/sandia-xyce-xyce
fi

