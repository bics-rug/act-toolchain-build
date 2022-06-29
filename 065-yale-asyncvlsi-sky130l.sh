#!/bin/bash

echo "#############################"
echo "# stdlib"

cd $EDA_SRCDIR/yale-asyncvlsi-sky130l
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-sky130l

make install || exit 1

