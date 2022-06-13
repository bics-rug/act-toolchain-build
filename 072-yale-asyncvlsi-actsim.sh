#!/bin/bash

echo "#############################"
echo "# actsim"

cd $EDA_SRCDIR/yale-asyncvlsi-actsim
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-actsim
#./grab_xyce.sh $EDA_SRCDIR/yale-asyncvlsi-xyce
./configure || exit 1
make depend 
make -j || exit 1
make install || exit 1

