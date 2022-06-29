#!/bin/bash

echo "#############################"
echo "# sky130"

if [ ! -d "$EDA_SRCDIR/yale-asyncvlsi-sky130l" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://github.com/asyncvlsi/sky130l.git
  mv sky130l yale-asyncvlsi-sky130l
fi

