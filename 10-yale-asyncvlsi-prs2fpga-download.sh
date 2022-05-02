#!/bin/bash

echo "#############################"
echo "# prs2fpga"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-prs2fpga" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/prs2fpga.git
  mv prs2fpga $EDA_SRCDIR/yale-asyncvlsi-prs2fpga
fi

