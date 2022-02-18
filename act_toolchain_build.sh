#!/bin/bash

# build full toolchain from scrach incl all dependencies
# when build on an old system like centos 7 binaries should be compatible with all newer versions of linux oses

# not called by CI so execute in order
if [ -z $EDA_SRCDIR ]; then 
  export EDA_SRCDIR=$(pwd)/src
fi

if [ -z $ACT_HOME ]; then 
  export ACT_HOME=$(pwd)/act
fi

if [ -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi

bash check_build_environment.sh || exit 1

bash yale-asyncvlsi-act-dependencies.sh || exit 1
bash yale-asyncvlsi-act.sh || exit 1

bash yale-asyncvlsi-stdlib.sh || exit 1
bash rug-bics-actlib_dataflow_neuro.sh || exit 1

bash yale-avlsi-expropt.sh || exit 1
bash yale-asyncvlsi-expropt-dependencies.sh || exit 1
bash yale-asyncvlsi-expropt.sh || exit 1

bash yale-asyncvlsi-chp2prs.sh || exit 1

bash yale-asyncvlsi-interact.sh || exit 1
