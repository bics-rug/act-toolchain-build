#!/bin/bash

echo "#############################"
echo "# expropt"

cd $EDA_SRCDIR/yale-asyncvlsi-expropt
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-expropt
./configure || exit 1
make realclean 2> /dev/null
make depend 
make -j || exit 1
make install || exit 1

