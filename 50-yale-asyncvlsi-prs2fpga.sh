#!/bin/bash

echo "#############################"
echo "# prs2fpga"

cd $EDA_SRCDIR/yale-asyncvlsi-prs2fpga
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
#make realclean 2> /dev/null
#make depend 
make -j || exit 1
make install || exit 1

