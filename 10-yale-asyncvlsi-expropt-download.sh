#!/bin/bash

if [ -z $ACT_ASYNCVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-expropt" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master $ACT_ASYNCVLSI_EXPROPT_URL
  mv expropt yale-asyncvlsi-expropt
fi
