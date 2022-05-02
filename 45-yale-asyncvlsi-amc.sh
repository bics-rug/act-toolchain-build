#!/bin/bash

echo "#############################"
echo "# amc"

cd $EDA_SRCDIR/yale-asyncvlsi-amc
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
cp -r . $ACT_HOME/amc
rm -rf $ACT_HOME/amc/.git*


