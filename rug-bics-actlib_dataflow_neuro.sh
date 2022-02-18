#!/bin/bash

echo "#############################"
echo "# dataflow classic neuromorphic "

if [ ! -d "$EDA_SRCDIR/rug-bics-actlib_dataflow_neuro" ]; then
cd $EDA_SRCDIR
  git clone https://git.web.rug.nl/bics/actlib_dataflow_neuro.git
  mv actlib_dataflow_neuro rug-bics-actlib_dataflow_neuro
fi
cd $EDA_SRCDIR/rug-bics-actlib_dataflow_neuro
git reset --hard && git checkout main && git pull
make || exit 1
make install || exit 1

