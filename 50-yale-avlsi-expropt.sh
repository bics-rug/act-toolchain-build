#!/bin/bash

if [ -z $ACT_AVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt com"

cd $EDA_SRCDIR/yale-avlsi-expropt

make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

