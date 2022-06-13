#!/bin/bash

echo "#############################"
echo "# lefdef"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-lefdef" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/lefdef.git
  mv lefdef $EDA_SRCDIR/yale-asyncvlsi-lefdef
fi

