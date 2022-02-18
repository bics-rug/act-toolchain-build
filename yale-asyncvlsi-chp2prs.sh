#!/bin/bash

echo "#############################"
echo "# chp2prs"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-chp2prs" ]; then
cd $EDA_SRCDIR
  git clone https://github.com/asyncvlsi/chp2prs.git
  mv chp2prs yale-asyncvlsi-chp2prs
fi
cd $EDA_SRCDIR/yale-asyncvlsi-chp2prs
git reset --hard && git checkout master && git pull
./configure || exit 1
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

