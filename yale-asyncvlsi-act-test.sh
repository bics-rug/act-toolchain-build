#!/bin/bash

echo "#############################"
echo "# testing act"

cd $VLSI_TOOLS_SRC
make runtest || exit 1

