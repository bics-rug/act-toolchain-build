#!/bin/bash

echo "#############################"
echo "# act"

cd $VLSI_TOOLS_SRC
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-act

./configure $ACT_HOME CFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib" || exit 1
make realclean 2> /dev/null
./build || exit 1
make install || exit 1

