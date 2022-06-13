#!/bin/bash

echo "#############################"
echo "# pwroute"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-pwroute" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/pwroute.git
  mv pwroute $EDA_SRCDIR/yale-asyncvlsi-pwroute
fi

