#!/bin/bash

echo "#############################"
echo "# dataflow classic neuromorphic "

if [ ! -d "$EDA_SRCDIR/rug-bics-actlib_dataflow_neuro" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch main https://git.web.rug.nl/bics/actlib_dataflow_neuro.git
  mv actlib_dataflow_neuro $EDA_SRCDIR/rug-bics-actlib_dataflow_neuro
fi

