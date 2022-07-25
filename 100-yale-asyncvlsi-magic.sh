#!/bin/bash

echo "############ Requires X11 and OpenGL #################"
if [ -z $BUILD_GUI ]; then
    exit 0;
fi

echo "#############################"
echo "# tk"
cd $EDA_SRCDIR/org-tcltk-tk
cp license.terms $ACT_HOME/license/LICENSE_org-tcltk-tk
cd unix
./configure --prefix=$ACT_HOME --with-tcl=$EDA_SRCDIR/org-tcltk-tcl/unix CFLAGS="-I${ACT_HOME}/include -L${ACT_HOME}/lib" LDFLAGS="-L${ACT_HOME}/lib -Wl,-rpath=\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib"
make -j || exit 1
make install || exit 1


echo "#############################"
echo "# magic"

cd $EDA_SRCDIR/yale-asyncvlsi-magic
# license
cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-magic

./configure --prefix=$ACT_HOME CFLAGS="-g -I${ACT_HOME}/include -L${ACT_HOME}/lib" LDFLAGS="-L${ACT_HOME}/lib -Wl,-rpath=\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib"
make || exit 1
make install || exit 1

sed -i 's/TCL_MAG_DIR=\${CAD_ROOT}\/magic\/tcl/TCL_MAG_DIR=\${ACT_HOME}\/lib\/magic\/tcl/' $ACT_HOME/bin/magic
sed -i 's/\/root\/project\/act/\${ACT_HOME}/g' $ACT_HOME/bin/magic