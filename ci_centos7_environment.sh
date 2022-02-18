source scl_source enable devtoolset-8
if [ ! -z $EDA_SRCDIR ]; then 
  export EDA_SRCDIR=$(pwd)/src
fi

if [ ! -z $ACT_HOME ]; then 
  export ACT_HOME=$(pwd)/act
fi

if [ ! -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi

export EXECDIR=$(pwd)

