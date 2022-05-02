#!/bin/bash

echo "#############################"
echo "# interact"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-interact" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/interact.git
  mv interact $EDA_SRCDIR/yale-asyncvlsi-interact
fi

