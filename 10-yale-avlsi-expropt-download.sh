#!/bin/bash

if [ -z $ACT_AVLSI_EXPROPT_URL ]; then 
  exit 0
fi

echo "#############################"
echo "# expropt com"

if [ ! -d "$EDA_SRCDIR/yale-avlsi-expropt" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master $ACT_AVLSI_EXPROPT_URL
  mv expropt yale-avlsi-expropt
fi

