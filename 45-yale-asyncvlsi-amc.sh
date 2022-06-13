#!/bin/bash

echo "#############################"
echo "# amc"

cd $EDA_SRCDIR/yale-asyncvlsi-amc
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-amc

cp -r . $ACT_HOME/amc
rm -rf $ACT_HOME/amc/.git*


