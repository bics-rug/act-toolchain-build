#!/bin/bash

echo "#############################"
echo "# IRsim"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-irsim" ]; then
cd $EDA_SRCDIR
  git clone https://github.com/asyncvlsi/irsim.git
  mv irsim yale-asyncvlsi-irsim
fi

