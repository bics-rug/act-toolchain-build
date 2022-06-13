#!/bin/bash

# build full toolchain from scrach incl all dependencies
# when build on an old system like centos 7 binaries should be compatible with all newer versions of linux oses

# not called by CI so execute in order
if [ -z $EDA_SRCDIR ]; then 
  export EDA_SRCDIR=$(pwd)/src
fi

if [ -z $ACT_HOME ]; then 
  export ACT_HOME=$(pwd)/act
  export PATH=$(pwd)/act/bin:${PATH}
fi

if [ -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi

echo "#############################################################################################"
echo "do you want to buid GUI tools (X11 and openGL required) [y/N]"
read userconfirm

if [[ $userconfirm != "y" ]]; then
    echo "no gui"
else
    echo "building gui programs"
    export BUILD_GUI="true"
fi

bash check_build_environment.sh || exit 1

for file in 01*; do echo $file; bash $file || exit 1; done
# 2 is packgaging not needed for local
for file in 03*; do echo $file; bash $file || exit 1; done
for file in 04*; do echo $file; bash $file || exit 1; done
for file in 05*; do echo $file; bash $file || exit 1; done
for file in 06*; do echo $file; bash $file || exit 1; done
for file in 07*; do echo $file; bash $file || exit 1; done
for file in 08*; do echo $file; bash $file || exit 1; done
for file in 09*; do echo $file; bash $file || exit 1; done
for file in 100*; do echo $file; bash $file || exit 1; done
# 8 is packing not needed for local
for file in 120*; do echo $file; bash $file || exit 1; done

