#!/bin/bash

echo "#############################"
echo "# chp2prs"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-chp2prs" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/chp2prs.git
  mv chp2prs yale-asyncvlsi-chp2prs
fi
