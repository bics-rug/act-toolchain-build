#!/bin/bash

echo "#############################"
echo "# testing chp2prs"

cd $EDA_SRCDIR/yale-asyncvlsi-chp2prs
make runtest || exit 1

