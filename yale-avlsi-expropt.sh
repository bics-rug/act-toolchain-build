#!/bin/bash

if [ -z $ACT_AVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt com"

if [ ! -d "$EDA_SRCDIR/yale-avlsi-expropt" ]; then
cd $EDA_SRCDIR
  git clone $ACT_AVLSI_EXPROPT_URL
  mv expropt yale-avlsi-expropt
fi
cd $EDA_SRCDIR/yale-avlsi-expropt
git reset --hard && git checkout master && git pull
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

