#!/bin/bash

echo "#############################"
echo "# testing act"

cd $EDA_SRCDIR/yale-asyncvlsi-chp2prs
make runtest || exit 1

