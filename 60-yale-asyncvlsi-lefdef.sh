#!/bin/bash

echo "#############################"
echo "# lef def"

cd $EDA_SRCDIR/yale-asyncvlsi-lefdef
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-lefdef

make || exit 1
make install || exit 1

