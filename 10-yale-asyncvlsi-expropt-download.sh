#!/bin/bash

echo "#############################"
echo "# expropt"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-expropt" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/expropt.git
  mv expropt yale-asyncvlsi-expropt
fi
