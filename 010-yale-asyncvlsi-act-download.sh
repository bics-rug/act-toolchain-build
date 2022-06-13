#!/bin/bash

echo "#############################"
echo "# act"

if [ ! -d $VLSI_TOOLS_SRC ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/act.git
  mv act $VLSI_TOOLS_SRC
fi

