#!/bin/bash

echo "#############################"
echo "# layout"

cd $EDA_SRCDIR/yale-asyncvlsi-layout
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-layout

make || exit 1
make install || exit 1