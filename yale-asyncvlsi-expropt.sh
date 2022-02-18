#!/bin/bash

if [ -z $ACT_ASYNCVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-expropt" ]; then
cd $EDA_SRCDIR
  git clone $ACT_ASYNCVLSI_EXPROPT_URL
  mv expropt yale-asyncvlsi-expropt
fi
cd $EDA_SRCDIR/yale-asyncvlsi-expropt
git reset --hard && git checkout main && git pull
./configure || exit 1
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

