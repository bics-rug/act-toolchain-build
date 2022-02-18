#!/bin/bash

echo "#############################"
echo "# act"

if [ ! -d $VLSI_TOOLS_SRC ]; then
cd $EDA_SRCDIR
  git clone https://github.com/asyncvlsi/act.git
  mv act $VLSI_TOOLS_SRC
fi
cd $VLSI_TOOLS_SRC
git reset --hard && git checkout master && git pull
./configure $ACT_HOME || exit 1
make realclean 2> /dev/null
./build || exit 1
make install || exit 1

