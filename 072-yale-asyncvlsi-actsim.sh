#!/bin/bash

echo "#############################"
echo "# actsim"

cd $EDA_SRCDIR/yale-asyncvlsi-actsim
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-actsim
./grab_xyce.sh $EDA_SRCDIR/yale-asyncvlsi-xyce/build
./configure || exit 1
make depend 
make || exit 1
make install || exit 1

