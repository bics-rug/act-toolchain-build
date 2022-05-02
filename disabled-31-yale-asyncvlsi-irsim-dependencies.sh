#!/bin/bash

echo "#############################"
echo "# irsim/magic dependencies"

cd $EDA_SRCDIR/org-tcltk-tcltk

./configure --prefix=$ACT_HOME --enable-threads --enable-shared LIBS="-L$ACT_HOME/lib ${LIBS}" CPPFLAGS="-I$ACT_HOME/include ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib"  || exit 1
make -j  || exit 1
make install  || exit 1
