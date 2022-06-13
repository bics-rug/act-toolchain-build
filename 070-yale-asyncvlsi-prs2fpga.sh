#!/bin/bash

echo "#############################"
echo "# prs2fpga"

cd $EDA_SRCDIR/yale-asyncvlsi-prs2fpga
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-prs2fpga

#make realclean 2> /dev/null
#make depend 
make || exit 1
make install || exit 1

