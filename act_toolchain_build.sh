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

if [ -z $LIB_HOME ]; then 
  export LIB_HOME=$(pwd)/build
fi

if [ -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi

echo "#############################################################################################"
echo "please specify if the repositories should be reset [y/N] before compilation (this is a distructive operation, not commited files will be deleted)"
read userconfirm

if [[ $userconfirm != "y" ]]; then
    echo "reset mode OFF"
else
    echo "reset mode ON"
    export FORCE_GIT_RESET="true"
fi

bash check_build_environment.sh || exit 1

for file in 1*; do echo $file; bash $file || exit 1; done
# 2 is packgaging not needed for local
for file in 3*; do echo $file; bash $file || exit 1; done
for file in 4*; do echo $file; bash $file || exit 1; done
for file in 5*; do echo $file; bash $file || exit 1; done
for file in 6*; do echo $file; bash $file || exit 1; done
for file in 7*; do echo $file; bash $file || exit 1; done

# 8 is packing not needed for local
for file in 9*; do echo $file; bash $file || exit 1; done

