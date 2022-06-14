#!/bin/bash
# from actflow/build
echo "#############################"
if [ ! -f $EDA_SRCDIR/yale-asyncvlsi-actflow-patches ]
then
   (cd $EDA_SRCDIR/utexas-intelligentsoftwaresystems-galois;
     patch -p0 < $EDA_SRCDIR/yale-asyncvlsi-actflow/extra/Galois;
     patch -p0 < $EDA_SRCDIR/yale-asyncvlsi-actflow/extra/Galois2;
     patch -p0 < $EDA_SRCDIR/yale-asyncvlsi-actflow/extra/Galois3
   )
   touch $EDA_SRCDIR/yale-asyncvlsi-actflow-patches
fi