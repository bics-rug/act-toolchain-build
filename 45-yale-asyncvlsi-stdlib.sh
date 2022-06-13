#!/bin/bash

echo "#############################"
echo "# stdlib"

cd $EDA_SRCDIR/yale-asyncvlsi-stdlib
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-stdlib

make || exit 1
make install || exit 1

