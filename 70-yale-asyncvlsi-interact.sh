#!/bin/bash

echo "#############################"
echo "# interact"

cd $EDA_SRCDIR/yale-asyncvlsi-interact
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-interact

./configure || exit 1
make realclean 2> /dev/null
make depend 
make || exit 1
make install || exit 1

