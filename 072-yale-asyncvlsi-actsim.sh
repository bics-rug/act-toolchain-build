#!/bin/bash

echo "#############################"
echo "# actsim"

cd $EDA_SRCDIR/yale-asyncvlsi-actsim
# license

cp LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-actsim

cd $EDA_SRCDIR/yale-asyncvlsi-actsim/xyce-bits

echo "##########"
echo "building xyce plugin"

#sed -i 's/#include <N_DEV_Algorithm.h>/ /' N_CIR_XyceCInterface.C
g++ -I$ACT_HOME/include -std=c++17 -I. -I$ACT_HOME/include -c N_CIR_XyceCInterface.C -fPIC || exit 1	

ar ruv libxycecinterface.a N_CIR_XyceCInterface.o || exit 1	
ranlib libxycecinterface.a

#ranlib libxycecinterface.a
cp libxycecinterface.a $ACT_HOME/lib/
cp N_CIR_XyceCInterface.h $ACT_HOME/include/


echo "##########"
echo "building actsim"
cd $EDA_SRCDIR/yale-asyncvlsi-actsim/
./grab_xyce.sh $EDA_SRCDIR/sandia-xyce-xyce/build
./configure || exit 1
make depend 
make || exit 1
make install || exit 1

