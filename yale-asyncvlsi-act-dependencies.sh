#!/bin/bash

# compile all dependencies from scrach so we have an almost dependency independent package


# first get zlib 
echo "#############################"
echo "# zlib"
if [ ! -d "$EDA_SRCDIR/zlib" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet https://www.zlib.net/zlib-1.2.11.tar.gz
  echo "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1 zlib-1.2.11.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/zlib
  tar -C "$EDA_SRCDIR/zlib" --strip-components=1 -xf zlib-1.2.11.tar.gz
  rm zlib-1.2.11.tar.gz
fi
cd $EDA_SRCDIR/zlib
./configure --prefix $ACT_HOME || exit 1
make -j || exit 1
make install || exit 1

echo "#############################"
echo "# ncurses"
if [ ! -d "$EDA_SRCDIR/ncurses" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet https://invisible-mirror.net/archives/ncurses/ncurses-6.3.tar.gz
  echo "97fc51ac2b085d4cde31ef4d2c3122c21abc217e9090a43a30fc5ec21684e059 ncurses-6.3.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/ncurses
  tar -C "$EDA_SRCDIR/ncurses" --strip-components=1 -xf ncurses-6.3.tar.gz
  rm ncurses-6.3.tar.gz
fi
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
if [ ! -d "$EDA_SRCDIR/libedit" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet --no-check-certificate https://www.thrysoee.dk/editline/libedit-20210910-3.1.tar.gz 
  echo "6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5 libedit-20210910-3.1.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/libedit
  tar -C "$EDA_SRCDIR/libedit" --strip-components=1 -xf libedit-20210910-3.1.tar.gz
  rm libedit-20210910-3.1.tar.gz
fi
cd "$EDA_SRCDIR/libedit"
autoreconf --force --include=$ACT_HOME/include
./configure --prefix $ACT_HOME LIBS="-L$ACT_HOME/lib ${LIBS}" CPPFLAGS="-I$ACT_HOME/include -I$ACT_HOME/include/ncurses ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=\\\$\$ACT_HOME/lib" || exit 1
make -j || exit 1
make install || exit 1
