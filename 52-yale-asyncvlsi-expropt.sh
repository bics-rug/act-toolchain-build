#!/bin/bash

if [ -z $ACT_ASYNCVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt"

cd $EDA_SRCDIR/yale-asyncvlsi-expropt
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
./configure || exit 1
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

