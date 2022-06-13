#!/bin/bash

echo "#############################"
echo "# tritonroute"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-tritonroutewxl" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/asyncvlsi/tritonroute-wxl.git
  mv tritonroute-wxl $EDA_SRCDIR/yale-asyncvlsi-tritonroutewxl
fi

