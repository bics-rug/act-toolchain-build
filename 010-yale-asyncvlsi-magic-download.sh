#!/bin/bash

echo "#############################"
echo "# magic"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-magic" ]; then
  cd $EDA_SRCDIR
  git clone https://github.com/asyncvlsi/magic.git
  mv magic $EDA_SRCDIR/yale-asyncvlsi-magic
fi

