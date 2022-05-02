#!/bin/bash

echo "#############################"
echo "# sproute"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-sproute" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/sproute.git
  mv sproute $EDA_SRCDIR/yale-asyncvlsi-sproute
fi

