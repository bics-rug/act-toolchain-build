#!/bin/bash

if [ -z $ACT_ASYNCVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt dependencies"

if [ ! -d "$EDA_SRCDIR/yosys" ]; then
cd $EDA_SRCDIR
  git clone https://github.com/yosyshq/yosys.git
fi
cd $EDA_SRCDIR/yosys
git reset --hard && git checkout master && git pull
./configure || exit 1
make clean 2> /dev/null
echo "CONFIG := gcc \nPREFIX := $ACT_HOME" > Makefile.conf
make -j || exit 1
make install || exit 1

if [ ! -d "$EDA_SRCDIR/yosys" ]; then
cd $EDA_SRCDIR
  git clone https://github.com/berkeley-abc/abc.git
fi
cd $EDA_SRCDIR/abc
git reset --hard && git checkout master && git pull
make clean 2> /dev/null
make -j || exit 1
make -j  ABC_USE_PIC=1 libabc.so || exit 1
make -j  libabc.a || exit 1
mv abc $ACT_HOME/bin/
mv libabc.* $ACT_HOME/lib/

