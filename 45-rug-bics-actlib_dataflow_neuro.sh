#!/bin/bash

echo "#############################"
echo "# dataflow classic neuromorphic "

cd $EDA_SRCDIR/rug-bics-actlib_dataflow_neuro
if [ -z $FORCE_GIT_RESET ]; then
   git reset --hard && git checkout main && git pull
else
   git pull
fi
make || exit 1
make install || exit 1

