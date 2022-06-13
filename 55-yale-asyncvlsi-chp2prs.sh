#!/bin/bash

echo "#############################"
echo "# chp2prs"

cd $EDA_SRCDIR/yale-asyncvlsi-chp2prs
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-chp2prs
./configure || exit 1
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

