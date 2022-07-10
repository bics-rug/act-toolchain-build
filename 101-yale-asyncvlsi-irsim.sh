#!/bin/bash

echo "############ Requires X11 and OpenGL #################"
if [ -z $BUILD_GUI ]; then
    exit 0;
fi

echo "#############################"
echo "# irsim"

cd $EDA_SRCDIR/yale-asyncvlsi-irsim
# license
cp COPYRIGHT $ACT_HOME/license/LICENSE_yale-asyncvlsi-irsim

./configure --prefix=$ACT_HOME CFLAGS="-g -I${ACT_HOME}/include -L${ACT_HOME}/lib" LDFLAGS="-L${ACT_HOME}/lib -Wl,-rpath=\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib"
make || exit 1
make install || exit 1

sed -i 's/\/root\/project\/act/\${ACT_HOME}/g' $ACT_HOME/bin/irsim

