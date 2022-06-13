#!/bin/bash

echo "#############################"
echo "# layout gen"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-layout" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/layout.git
  mv layout yale-asyncvlsi-layout
fi

