#!/bin/bash

echo "#############################"
echo "# act"

if [ ! -d $EDA_SRCDIR/yale-asyncvlsi-actflow ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/actflow.git
  mv actflow $EDA_SRCDIR/yale-asyncvlsi-actflow
fi

