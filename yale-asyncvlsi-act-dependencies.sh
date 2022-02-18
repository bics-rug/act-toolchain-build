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
echo "# libedit"
if [ ! -d "$EDA_SRCDIR/libedit" ]; then
  cd $EDA_SRCDIR
  git clone https://salsa.debian.org/debian/libedit.git
fi
cd "$EDA_SRCDIR/libedit"
git reset --hard && git checkout master && git pull
./configure --prefix $ACT_HOME || exit 1
make -j || exit 1
make install || exit 1
