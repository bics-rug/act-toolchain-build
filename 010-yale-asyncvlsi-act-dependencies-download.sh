#!/bin/bash

# download all dependencies from scrach so we have an almost dependency independent package


# first get zlib 
echo "#############################"
echo "# zlib"
if [ ! -d "$EDA_SRCDIR/zlib" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet https://www.zlib.net/zlib-1.2.12.tar.gz
  echo "91844808532e5ce316b3c010929493c0244f3d37593afd6de04f71821d5136d9 zlib-1.2.12.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/zlib
  tar -C "$EDA_SRCDIR/zlib" --strip-components=1 -xf zlib-1.2.12.tar.gz
  rm zlib-1.2.12.tar.gz
fi

echo "#############################"
echo "# ncurses"
if [ ! -d "$EDA_SRCDIR/ncurses" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet --no-check-certificate https://invisible-mirror.net/archives/ncurses/current/ncurses-6.3-20220423.tgz
  echo "a6bdfe499ae98ee937fed4729de09ffea08201317a9d16ed5d0142ac8b8b30e1 ncurses-6.3-20220423.tgz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/ncurses
  tar -C "$EDA_SRCDIR/ncurses" --strip-components=1 -xf ncurses-6.3-20220423.tgz
  rm ncurses-6.3-20220423.tgz
fi

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

