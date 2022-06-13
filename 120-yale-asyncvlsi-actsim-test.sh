#!/bin/bash

echo "#############################"
echo "# actsim test binaries"

source test_helper.sh

lookup_binary "actsim"


echo "#############################"
echo "# actsim test suit"

cd $EDA_SRCDIR/yale-asyncvlsi-actsim

sed -i 's/ACTTOOL=..\/..\/actsim.$EXT/ACTTOOL=actsim/' test/run_inf.sh
sed -i 's/ACTTOOL=..\/..\/actsim.$EXT/ACTTOOL=actsim/' test/run_num.sh
sed -i 's/ACTTOOL=..\/..\/actsim.$EXT/ACTTOOL=actsim/' test/validate_inf.sh
sed -i 's/ACTTOOL=..\/..\/actsim.$EXT/ACTTOOL=actsim/' test/validate_num.sh

make runtest || exit 1

