#!/bin/bash

# compile all dependencies from scrach so we have an almost dependency independent package


# first get zlib 
echo "#############################"
echo "# zlib"
cd $EDA_SRCDIR/zlib
./configure --prefix $ACT_HOME || exit 1
make -j || exit 1
make install || exit 1

echo "#############################"
echo "# ncurses"
cd $EDA_SRCDIR/ncurses
#this is for the ci because i cant convice libedit to pic up th custom dir, it will fail on normal systems
#./configure --with-shared --without-debug || exit 1
#make -j || exit 1
#make install 

./configure --with-shared --without-debug --prefix $ACT_HOME || exit 1
make -j || exit 1
make install || exit 1

echo "#############################"
echo "# libedit"
cd "$EDA_SRCDIR/libedit"
autoreconf --force --include=$ACT_HOME/include
./configure --prefix $ACT_HOME LIBS="-L$ACT_HOME/lib ${LIBS}" CPPFLAGS="-I$ACT_HOME/include -I$ACT_HOME/include/ncurses ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" || exit 1
make -j || exit 1
make install || exit 1
