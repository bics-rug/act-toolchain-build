#!/bin/bash

if [ -z $ACT_ASYNCVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt dependencies"

if [ ! -d "$EDA_SRCDIR/yosys" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/yosyshq/yosys.git
fi

if [ ! -d "$EDA_SRCDIR/abc" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/berkeley-abc/abc.git
fi

