#!/bin/bash

if [ -z $ACT_ASYNCVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt dependencies"

cd $EDA_SRCDIR/yosys
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout master && git pull
else
   git pull
fi
./configure || exit 1
make clean 2> /dev/null
echo "CONFIG := gcc \nPREFIX := $ACT_HOME" > Makefile.conf
make -j || exit 1
make install || exit 1

cd $EDA_SRCDIR/abc
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout master && git pull
else
   git pull
fi
make clean 2> /dev/null
make -j || exit 1
make -j  ABC_USE_PIC=1 libabc.so || exit 1
make -j  libabc.a || exit 1
mv abc $ACT_HOME/bin/
mv libabc.* $ACT_HOME/lib/

